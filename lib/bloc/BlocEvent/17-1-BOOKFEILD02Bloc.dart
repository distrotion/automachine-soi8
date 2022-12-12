import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';

import '../../page/17BOOKFEILD02/BOOKFEILD02MAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class BOOKFEILD02Bloc_Event {}

class BOOKFEILD02Bloc_Read extends BOOKFEILD02Bloc_Event {}

class BOOKFEILD02Bloc_Flush extends BOOKFEILD02Bloc_Event {}

class BOOKFEILD02Bloc_Bloc
    extends Bloc<BOOKFEILD02Bloc_Event, BOOKFEILD02Receive> {
  BOOKFEILD02Bloc_Bloc() : super(BOOKFEILD02Receive()) {
    on<BOOKFEILD02Bloc_Read>((event, emit) {
      return _BOOKFEILD02Bloc_Read(BOOKFEILD02Receive(), emit);
    });
    on<BOOKFEILD02Bloc_Flush>((event, emit) {
      return _BOOKFEILD02Bloc_Flush(BOOKFEILD02Receive(), emit);
    });
  }
  Future<void> _BOOKFEILD02Bloc_Read(
      BOOKFEILD02Receive toAdd, Emitter<BOOKFEILD02Receive> emit) async {
    BOOKFEILD02Receive output = BOOKFEILD02Receive();

    FreeLoading(BOOKFEILD02MAINcontext);

    final response = await Dio().post(
      server + "getBOOKFEILD02",
      data: {},
    );
    if (response.statusCode == 200) {
      Navigator.pop(BOOKFEILD02MAINcontext);
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
      Navigator.pop(BOOKFEILD02MAINcontext);
    }

    emit(output);
  }

  Future<void> _BOOKFEILD02Bloc_Flush(
      BOOKFEILD02Receive toAdd, Emitter<BOOKFEILD02Receive> emit) async {
    BOOKFEILD02Receive output = BOOKFEILD02Receive();
    emit(output);
  }
}

class BOOKFEILD02Receive {
  BOOKFEILD02Receive({
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
