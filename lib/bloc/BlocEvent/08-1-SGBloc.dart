import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';

import '../../page/08SG/SGMAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class SGBloc_Event {}

class SGBloc_Read extends SGBloc_Event {}

class SGBloc_Flush extends SGBloc_Event {}

class SGBloc_Bloc extends Bloc<SGBloc_Event, SGReceive> {
  SGBloc_Bloc() : super(SGReceive()) {
    on<SGBloc_Read>((event, emit) {
      return _SGBloc_Read(SGReceive(), emit);
    });
    on<SGBloc_Flush>((event, emit) {
      return _SGBloc_Flush(SGReceive(), emit);
    });
  }
  Future<void> _SGBloc_Read(SGReceive toAdd, Emitter<SGReceive> emit) async {
    SGReceive output = SGReceive();

    FreeLoading(SGMAINcontext);

    final response = await Dio().post(
      server + "getSG",
      data: {},
    );
    if (response.statusCode == 200) {
      Navigator.pop(SGMAINcontext);
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
      Navigator.pop(SGMAINcontext);
    }

    emit(output);
  }

  Future<void> _SGBloc_Flush(SGReceive toAdd, Emitter<SGReceive> emit) async {
    SGReceive output = SGReceive();
    emit(output);
  }
}

class SGReceive {
  SGReceive({
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
