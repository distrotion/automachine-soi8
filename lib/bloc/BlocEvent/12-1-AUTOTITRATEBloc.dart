import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';

import '../../page/12AUTOTITRATE/AUTOTITRATEMAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class AUTOTITRATEBloc_Event {}

class AUTOTITRATEBloc_Read extends AUTOTITRATEBloc_Event {}

class AUTOTITRATEBloc_Flush extends AUTOTITRATEBloc_Event {}

class AUTOTITRATEBloc_Bloc
    extends Bloc<AUTOTITRATEBloc_Event, AUTOTITRATEReceive> {
  AUTOTITRATEBloc_Bloc() : super(AUTOTITRATEReceive()) {
    on<AUTOTITRATEBloc_Read>((event, emit) {
      return _AUTOTITRATEBloc_Read(AUTOTITRATEReceive(), emit);
    });
    on<AUTOTITRATEBloc_Flush>((event, emit) {
      return _AUTOTITRATEBloc_Flush(AUTOTITRATEReceive(), emit);
    });
  }
  Future<void> _AUTOTITRATEBloc_Read(
      AUTOTITRATEReceive toAdd, Emitter<AUTOTITRATEReceive> emit) async {
    AUTOTITRATEReceive output = AUTOTITRATEReceive();

    FreeLoading(AUTOTITRATEMAINcontext);

    final response = await Dio().post(
      server + "getAUTOTITRATE",
      data: {},
    );
    if (response.statusCode == 200) {
      Navigator.pop(AUTOTITRATEMAINcontext);
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
      Navigator.pop(AUTOTITRATEMAINcontext);
    }

    emit(output);
  }

  Future<void> _AUTOTITRATEBloc_Flush(
      AUTOTITRATEReceive toAdd, Emitter<AUTOTITRATEReceive> emit) async {
    AUTOTITRATEReceive output = AUTOTITRATEReceive();
    emit(output);
  }
}

class AUTOTITRATEReceive {
  AUTOTITRATEReceive({
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
