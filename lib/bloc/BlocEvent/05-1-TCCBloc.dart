import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';

import '../../page/05TCC/TCCMAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class TCCBloc_Event {}

class TCCBloc_Read extends TCCBloc_Event {}

class TCCBloc_Flush extends TCCBloc_Event {}

class TCCBloc_Bloc extends Bloc<TCCBloc_Event, TCCReceive> {
  TCCBloc_Bloc() : super(TCCReceive()) {
    on<TCCBloc_Read>((event, emit) {
      return _TCCBloc_Read(TCCReceive(), emit);
    });
    on<TCCBloc_Flush>((event, emit) {
      return _TCCBloc_Flush(TCCReceive(), emit);
    });
  }
  Future<void> _TCCBloc_Read(TCCReceive toAdd, Emitter<TCCReceive> emit) async {
    TCCReceive output = TCCReceive();

    FreeLoading(TCCMAINcontext);

    final response = await Dio().post(
      server + "getFPTCC",
      data: {},
    );
    if (response.statusCode == 200) {
      Navigator.pop(TCCMAINcontext);
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
      Navigator.pop(TCCMAINcontext);
    }

    emit(output);
  }

  Future<void> _TCCBloc_Flush(
      TCCReceive toAdd, Emitter<TCCReceive> emit) async {
    TCCReceive output = TCCReceive();
    emit(output);
  }
}

class TCCReceive {
  TCCReceive({
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
