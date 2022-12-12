import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';

import '../../page/13PARTICALSIZE/PARTICALSIZEMAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class PARTICLESIZEBloc_Event {}

class PARTICLESIZEBloc_Read extends PARTICLESIZEBloc_Event {}

class PARTICLESIZEBloc_Flush extends PARTICLESIZEBloc_Event {}

class PARTICLESIZEBloc_Bloc
    extends Bloc<PARTICLESIZEBloc_Event, PARTICLESIZEReceive> {
  PARTICLESIZEBloc_Bloc() : super(PARTICLESIZEReceive()) {
    on<PARTICLESIZEBloc_Read>((event, emit) {
      return _PARTICLESIZEBloc_Read(PARTICLESIZEReceive(), emit);
    });
    on<PARTICLESIZEBloc_Flush>((event, emit) {
      return _PARTICLESIZEBloc_Flush(PARTICLESIZEReceive(), emit);
    });
  }
  Future<void> _PARTICLESIZEBloc_Read(
      PARTICLESIZEReceive toAdd, Emitter<PARTICLESIZEReceive> emit) async {
    PARTICLESIZEReceive output = PARTICLESIZEReceive();

    FreeLoading(PARTICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "getPARTICLESIZE",
      data: {},
    );
    if (response.statusCode == 200) {
      Navigator.pop(PARTICLESIZEMAINcontext);
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
      Navigator.pop(PARTICLESIZEMAINcontext);
    }

    emit(output);
  }

  Future<void> _PARTICLESIZEBloc_Flush(
      PARTICLESIZEReceive toAdd, Emitter<PARTICLESIZEReceive> emit) async {
    PARTICLESIZEReceive output = PARTICLESIZEReceive();
    emit(output);
  }
}

class PARTICLESIZEReceive {
  PARTICLESIZEReceive({
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
