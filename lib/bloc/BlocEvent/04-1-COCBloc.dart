import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';
import '../../page/02WeightBalance01/WeightBalance01MAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class COCBloc_Event {}

class COCBloc_Read extends COCBloc_Event {}

class COCBloc_Flush extends COCBloc_Event {}

class COCBloc_Bloc extends Bloc<COCBloc_Event, COCReceive> {
  COCBloc_Bloc() : super(COCReceive()) {
    on<COCBloc_Read>((event, emit) {
      return _COCBloc_Read(COCReceive(), emit);
    });
    on<COCBloc_Flush>((event, emit) {
      return _COCBloc_Flush(COCReceive(), emit);
    });
  }
  Future<void> _COCBloc_Read(COCReceive toAdd, Emitter<COCReceive> emit) async {
    COCReceive output = COCReceive();

    FreeLoading(WeightBalanceMAINcontext);

    final response = await Dio().post(
      server + "getWBA01",
      data: {},
    );
    if (response.statusCode == 200) {
      Navigator.pop(WeightBalanceMAINcontext);
      var databuff = response.data;
      if (databuff != null) {
        output.UserID =
            databuff['UserID'] != null ? databuff['UserID'].toString() : '';
        output.InstrumentID = databuff['InstrumentID'] != null
            ? databuff['InstrumentID'].toString()
            : '';
        output.Barcode =
            databuff['Barcode'] != null ? databuff['Barcode'].toString() : '';
        output.DataPreview = databuff['DataPreview'] != null
            ? databuff['DataPreview'].toString()
            : '';
        output.Result =
            databuff['Result'] != null ? databuff['Result'].toString() : '';
        output.SPEChi =
            databuff['SPEChi'] != null ? databuff['SPEChi'].toString() : '';
        output.SPEClow =
            databuff['SPEClow'] != null ? databuff['SPEClow'].toString() : '';
      }
    } else {
      //
      Navigator.pop(WeightBalanceMAINcontext);
    }

    emit(output);
  }

  Future<void> _COCBloc_Flush(
      COCReceive toAdd, Emitter<COCReceive> emit) async {
    COCReceive output = COCReceive();
    emit(output);
  }
}

class COCReceive {
  COCReceive({
    this.UserID = '',
    this.InstrumentID = '',
    this.Barcode = '',
    this.DataPreview = '',
    this.Result = '',
    this.SPEChi = '',
    this.SPEClow = '',
    this.SEND = '',
  });
  String UserID;
  String InstrumentID;
  String Barcode;
  String DataPreview;
  String Result;
  String SPEChi;
  String SPEClow;
  String SEND;
}
