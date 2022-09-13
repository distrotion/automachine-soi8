import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';
import '../../page/02WeightBalance01/WeightBalance01MAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class PHBloc_Event {}

class PHBloc_Read extends PHBloc_Event {}

class PHBloc_Flush extends PHBloc_Event {}

class PHBloc_Bloc extends Bloc<PHBloc_Event, PHReceive> {
  PHBloc_Bloc() : super(PHReceive()) {
    on<PHBloc_Read>((event, emit) {
      return _PHBloc_Read(PHReceive(), emit);
    });
    on<PHBloc_Flush>((event, emit) {
      return _PHBloc_Flush(PHReceive(), emit);
    });
  }
  Future<void> _PHBloc_Read(PHReceive toAdd, Emitter<PHReceive> emit) async {
    PHReceive output = PHReceive();

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

  Future<void> _PHBloc_Flush(PHReceive toAdd, Emitter<PHReceive> emit) async {
    PHReceive output = PHReceive();
    emit(output);
  }
}

class PHReceive {
  PHReceive({
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
