import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';

import '../../page/13PARTICALSIZE/PARTICALSIZEMAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class PATICLESIZEBloc_Event {}

class PATICLESIZEBloc_Read extends PATICLESIZEBloc_Event {}

class PATICLESIZEBloc_Flush extends PATICLESIZEBloc_Event {}

class PATICLESIZEBloc_Bloc
    extends Bloc<PATICLESIZEBloc_Event, PATICLESIZEReceive> {
  PATICLESIZEBloc_Bloc() : super(PATICLESIZEReceive()) {
    on<PATICLESIZEBloc_Read>((event, emit) {
      return _PATICLESIZEBloc_Read(PATICLESIZEReceive(), emit);
    });
    on<PATICLESIZEBloc_Flush>((event, emit) {
      return _PATICLESIZEBloc_Flush(PATICLESIZEReceive(), emit);
    });
  }
  Future<void> _PATICLESIZEBloc_Read(
      PATICLESIZEReceive toAdd, Emitter<PATICLESIZEReceive> emit) async {
    PATICLESIZEReceive output = PATICLESIZEReceive();

    FreeLoading(PATICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "getPATICLESIZE",
      data: {},
    );
    if (response.statusCode == 200) {
      Navigator.pop(PATICLESIZEMAINcontext);
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
      Navigator.pop(PATICLESIZEMAINcontext);
    }

    emit(output);
  }

  Future<void> _PATICLESIZEBloc_Flush(
      PATICLESIZEReceive toAdd, Emitter<PATICLESIZEReceive> emit) async {
    PATICLESIZEReceive output = PATICLESIZEReceive();
    emit(output);
  }
}

class PATICLESIZEReceive {
  PATICLESIZEReceive({
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
