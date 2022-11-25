import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';

import '../../page/09DENSITY/DENSITYMAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class DENSITYBloc_Event {}

class DENSITYBloc_Read extends DENSITYBloc_Event {}

class DENSITYBloc_Flush extends DENSITYBloc_Event {}

class DENSITYBloc_Bloc extends Bloc<DENSITYBloc_Event, DENSITYReceive> {
  DENSITYBloc_Bloc() : super(DENSITYReceive()) {
    on<DENSITYBloc_Read>((event, emit) {
      return _DENSITYBloc_Read(DENSITYReceive(), emit);
    });
    on<DENSITYBloc_Flush>((event, emit) {
      return _DENSITYBloc_Flush(DENSITYReceive(), emit);
    });
  }
  Future<void> _DENSITYBloc_Read(
      DENSITYReceive toAdd, Emitter<DENSITYReceive> emit) async {
    DENSITYReceive output = DENSITYReceive();

    FreeLoading(DENSITYMAINcontext);

    final response = await Dio().post(
      server + "getDENSITY",
      data: {},
    );
    if (response.statusCode == 200) {
      Navigator.pop(DENSITYMAINcontext);
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
      Navigator.pop(DENSITYMAINcontext);
    }

    emit(output);
  }

  Future<void> _DENSITYBloc_Flush(
      DENSITYReceive toAdd, Emitter<DENSITYReceive> emit) async {
    DENSITYReceive output = DENSITYReceive();
    emit(output);
  }
}

class DENSITYReceive {
  DENSITYReceive({
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
