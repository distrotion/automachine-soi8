import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';

import '../../page/18PENETROMETER/PENETROMETERMAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class PENETROMETERBloc_Event {}

class PENETROMETERBloc_Read extends PENETROMETERBloc_Event {}

class PENETROMETERBloc_Flush extends PENETROMETERBloc_Event {}

class PENETROMETERBloc_Bloc
    extends Bloc<PENETROMETERBloc_Event, PENETROMETERReceive> {
  PENETROMETERBloc_Bloc() : super(PENETROMETERReceive()) {
    on<PENETROMETERBloc_Read>((event, emit) {
      return _PENETROMETERBloc_Read(PENETROMETERReceive(), emit);
    });
    on<PENETROMETERBloc_Flush>((event, emit) {
      return _PENETROMETERBloc_Flush(PENETROMETERReceive(), emit);
    });
  }
  Future<void> _PENETROMETERBloc_Read(
      PENETROMETERReceive toAdd, Emitter<PENETROMETERReceive> emit) async {
    PENETROMETERReceive output = PENETROMETERReceive();

    FreeLoading(PENETROMETERMAINcontext);

    final response = await Dio().post(
      server + "getPENETROMETER",
      data: {},
    );
    if (response.statusCode == 200) {
      Navigator.pop(PENETROMETERMAINcontext);
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
      Navigator.pop(PENETROMETERMAINcontext);
    }

    emit(output);
  }

  Future<void> _PENETROMETERBloc_Flush(
      PENETROMETERReceive toAdd, Emitter<PENETROMETERReceive> emit) async {
    PENETROMETERReceive output = PENETROMETERReceive();
    emit(output);
  }
}

class PENETROMETERReceive {
  PENETROMETERReceive({
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
