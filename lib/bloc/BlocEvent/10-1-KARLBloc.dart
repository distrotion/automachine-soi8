import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';

import '../../page/10KARL/KARLMAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class KARLBloc_Event {}

class KARLBloc_Read extends KARLBloc_Event {}

class KARLBloc_Flush extends KARLBloc_Event {}

class KARLBloc_Bloc extends Bloc<KARLBloc_Event, KARLReceive> {
  KARLBloc_Bloc() : super(KARLReceive()) {
    on<KARLBloc_Read>((event, emit) {
      return _KARLBloc_Read(KARLReceive(), emit);
    });
    on<KARLBloc_Flush>((event, emit) {
      return _KARLBloc_Flush(KARLReceive(), emit);
    });
  }
  Future<void> _KARLBloc_Read(
      KARLReceive toAdd, Emitter<KARLReceive> emit) async {
    KARLReceive output = KARLReceive();

    FreeLoading(KARLMAINcontext);

    final response = await Dio().post(
      server + "getKARL",
      data: {},
    );
    if (response.statusCode == 200) {
      Navigator.pop(KARLMAINcontext);
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
      Navigator.pop(KARLMAINcontext);
    }

    emit(output);
  }

  Future<void> _KARLBloc_Flush(
      KARLReceive toAdd, Emitter<KARLReceive> emit) async {
    KARLReceive output = KARLReceive();
    emit(output);
  }
}

class KARLReceive {
  KARLReceive({
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
