import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';
import '../../page/02WeightBalance01/WeightBalance01MAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class SCCBloc_Event {}

class SCCBloc_Read extends SCCBloc_Event {}

class SCCBloc_Flush extends SCCBloc_Event {}

class SCCBloc_Bloc extends Bloc<SCCBloc_Event, SCCReceive> {
  SCCBloc_Bloc() : super(SCCReceive()) {
    on<SCCBloc_Read>((event, emit) {
      return _SCCBloc_Read(SCCReceive(), emit);
    });
    on<SCCBloc_Flush>((event, emit) {
      return _SCCBloc_Flush(SCCReceive(), emit);
    });
  }
  Future<void> _SCCBloc_Read(SCCReceive toAdd, Emitter<SCCReceive> emit) async {
    SCCReceive output = SCCReceive();

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

  Future<void> _SCCBloc_Flush(
      SCCReceive toAdd, Emitter<SCCReceive> emit) async {
    SCCReceive output = SCCReceive();
    emit(output);
  }
}

class SCCReceive {
  SCCReceive({
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
