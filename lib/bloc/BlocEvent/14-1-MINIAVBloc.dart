import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';

import '../../page/14MINIAV/MINIAVMAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class MINIAVBloc_Event {}

class MINIAVBloc_Read extends MINIAVBloc_Event {}

class MINIAVBloc_Flush extends MINIAVBloc_Event {}

class MINIAVBloc_Bloc extends Bloc<MINIAVBloc_Event, MINIAVReceive> {
  MINIAVBloc_Bloc() : super(MINIAVReceive()) {
    on<MINIAVBloc_Read>((event, emit) {
      return _MINIAVBloc_Read(MINIAVReceive(), emit);
    });
    on<MINIAVBloc_Flush>((event, emit) {
      return _MINIAVBloc_Flush(MINIAVReceive(), emit);
    });
  }
  Future<void> _MINIAVBloc_Read(
      MINIAVReceive toAdd, Emitter<MINIAVReceive> emit) async {
    MINIAVReceive output = MINIAVReceive();

    FreeLoading(MINIAVMAINcontext);

    final response = await Dio().post(
      server + "getMINIAV",
      data: {},
    );
    if (response.statusCode == 200) {
      Navigator.pop(MINIAVMAINcontext);
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
      Navigator.pop(MINIAVMAINcontext);
    }

    emit(output);
  }

  Future<void> _MINIAVBloc_Flush(
      MINIAVReceive toAdd, Emitter<MINIAVReceive> emit) async {
    MINIAVReceive output = MINIAVReceive();
    emit(output);
  }
}

class MINIAVReceive {
  MINIAVReceive({
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
