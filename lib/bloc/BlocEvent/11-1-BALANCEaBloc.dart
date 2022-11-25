import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';

import '../../page/11BALANCEa/BALANCEaMAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class BALANCEaBloc_Event {}

class BALANCEaBloc_Read extends BALANCEaBloc_Event {}

class BALANCEaBloc_Flush extends BALANCEaBloc_Event {}

class BALANCEaBloc_Bloc extends Bloc<BALANCEaBloc_Event, BALANCEaReceive> {
  BALANCEaBloc_Bloc() : super(BALANCEaReceive()) {
    on<BALANCEaBloc_Read>((event, emit) {
      return _BALANCEaBloc_Read(BALANCEaReceive(), emit);
    });
    on<BALANCEaBloc_Flush>((event, emit) {
      return _BALANCEaBloc_Flush(BALANCEaReceive(), emit);
    });
  }
  Future<void> _BALANCEaBloc_Read(
      BALANCEaReceive toAdd, Emitter<BALANCEaReceive> emit) async {
    BALANCEaReceive output = BALANCEaReceive();

    FreeLoading(BALANCEaMAINcontext);

    final response = await Dio().post(
      server + "getBALANCEa",
      data: {},
    );
    if (response.statusCode == 200) {
      Navigator.pop(BALANCEaMAINcontext);
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
      Navigator.pop(BALANCEaMAINcontext);
    }

    emit(output);
  }

  Future<void> _BALANCEaBloc_Flush(
      BALANCEaReceive toAdd, Emitter<BALANCEaReceive> emit) async {
    BALANCEaReceive output = BALANCEaReceive();
    emit(output);
  }
}

class BALANCEaReceive {
  BALANCEaReceive({
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
