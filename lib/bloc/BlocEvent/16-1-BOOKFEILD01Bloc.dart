import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';

import '../../page/16BOOKFEILD01/BOOKFEILD01MAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class BOOKFEILD01Bloc_Event {}

class BOOKFEILD01Bloc_Read extends BOOKFEILD01Bloc_Event {}

class BOOKFEILD01Bloc_Flush extends BOOKFEILD01Bloc_Event {}

class BOOKFEILD01Bloc_Bloc
    extends Bloc<BOOKFEILD01Bloc_Event, BOOKFEILD01Receive> {
  BOOKFEILD01Bloc_Bloc() : super(BOOKFEILD01Receive()) {
    on<BOOKFEILD01Bloc_Read>((event, emit) {
      return _BOOKFEILD01Bloc_Read(BOOKFEILD01Receive(), emit);
    });
    on<BOOKFEILD01Bloc_Flush>((event, emit) {
      return _BOOKFEILD01Bloc_Flush(BOOKFEILD01Receive(), emit);
    });
  }
  Future<void> _BOOKFEILD01Bloc_Read(
      BOOKFEILD01Receive toAdd, Emitter<BOOKFEILD01Receive> emit) async {
    BOOKFEILD01Receive output = BOOKFEILD01Receive();

    FreeLoading(BOOKFEILD01MAINcontext);

    final response = await Dio().post(
      server + "getBOOKFEILD01",
      data: {},
    );
    if (response.statusCode == 200) {
      Navigator.pop(BOOKFEILD01MAINcontext);
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
      Navigator.pop(BOOKFEILD01MAINcontext);
    }

    emit(output);
  }

  Future<void> _BOOKFEILD01Bloc_Flush(
      BOOKFEILD01Receive toAdd, Emitter<BOOKFEILD01Receive> emit) async {
    BOOKFEILD01Receive output = BOOKFEILD01Receive();
    emit(output);
  }
}

class BOOKFEILD01Receive {
  BOOKFEILD01Receive({
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
