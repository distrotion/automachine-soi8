import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';

import '../../page/03WeightBalance02/WeightBalance02MAIN.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

String server = serverG;

abstract class WeighBalance02Bloc_Event {}

class WeighBalance02Bloc_Read extends WeighBalance02Bloc_Event {}

class WeighBalance02Bloc_Flush extends WeighBalance02Bloc_Event {}

class WeighBalance02Bloc_Bloc
    extends Bloc<WeighBalance02Bloc_Event, WeighBalance02Receive> {
  WeighBalance02Bloc_Bloc() : super(WeighBalance02Receive()) {
    on<WeighBalance02Bloc_Read>((event, emit) {
      return _WeighBalance02Bloc_Read(WeighBalance02Receive(), emit);
    });
    on<WeighBalance02Bloc_Flush>((event, emit) {
      return _WeighBalance02Bloc_Flush(WeighBalance02Receive(), emit);
    });
  }
  Future<void> _WeighBalance02Bloc_Read(
      WeighBalance02Receive toAdd, Emitter<WeighBalance02Receive> emit) async {
    WeighBalance02Receive output = WeighBalance02Receive();

    FreeLoading(WeightBalance02MAINcontext);

    final response = await Dio().post(
      server + "getWBA02",
      data: {},
    );
    if (response.statusCode == 200) {
      Navigator.pop(WeightBalance02MAINcontext);
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
        //
        output.W11 = databuff['W11'] != null ? databuff['W11'].toString() : '';
        output.W12 = databuff['W12'] != null ? databuff['W12'].toString() : '';
        output.W13 = databuff['W13'] != null ? databuff['W13'].toString() : '';
        output.A01 = databuff['A01'] != null ? databuff['A01'].toString() : '';
        output.isW1 =
            databuff['isW1'] != null ? databuff['isW1'].toString() : '';
        //
        output.W21 = databuff['W21'] != null ? databuff['W21'].toString() : '';
        output.W22 = databuff['W22'] != null ? databuff['W22'].toString() : '';
        output.W23 = databuff['W23'] != null ? databuff['W23'].toString() : '';
        output.A02 = databuff['A02'] != null ? databuff['A02'].toString() : '';
        output.isW2 =
            databuff['isW2'] != null ? databuff['isW2'].toString() : '';
        //
        output.W31 = databuff['W31'] != null ? databuff['W31'].toString() : '';
        output.W32 = databuff['W32'] != null ? databuff['W32'].toString() : '';
        output.W33 = databuff['W33'] != null ? databuff['W33'].toString() : '';
        output.A03 = databuff['A03'] != null ? databuff['A03'].toString() : '';
        output.isW3 =
            databuff['isW3'] != null ? databuff['isW3'].toString() : '';
        //
        output.Result =
            databuff['Result'] != null ? databuff['Result'].toString() : '';

        output.SPEChi =
            databuff['SPEChi'] != null ? databuff['SPEChi'].toString() : '';
        output.SPEClow =
            databuff['SPEClow'] != null ? databuff['SPEClow'].toString() : '';

        output.SEND =
            databuff['SEND'] != null ? databuff['SEND'].toString() : '';

        output.dip12 =
            databuff['dip1-2'] != null ? databuff['dip1-2'].toString() : '';
        output.dip13 =
            databuff['dip1-3'] != null ? databuff['dip1-3'].toString() : '';
        output.dip23 =
            databuff['dip2-3'] != null ? databuff['dip2-3'].toString() : '';
      }
    } else {
      //
      Navigator.pop(WeightBalance02MAINcontext);
    }

    emit(output);
  }

  Future<void> _WeighBalance02Bloc_Flush(
      WeighBalance02Receive toAdd, Emitter<WeighBalance02Receive> emit) async {
    WeighBalance02Receive output = WeighBalance02Receive();
    emit(output);
  }
}

class WeighBalance02Receive {
  WeighBalance02Receive({
    this.UserID = '',
    this.InstrumentID = '',
    this.Barcode = '',
    this.DataPreview = '',
    this.W11 = '',
    this.W12 = '',
    this.W13 = '',
    this.A01 = '',
    this.isW1 = '',
    this.W21 = '',
    this.W22 = '',
    this.W23 = '',
    this.A02 = '',
    this.isW2 = '',
    this.W31 = '',
    this.W32 = '',
    this.W33 = '',
    this.A03 = '',
    this.isW3 = '',
    this.Result = '',
    this.SPEChi = '',
    this.SPEClow = '',
    this.SEND = '',
    this.dip12 = '',
    this.dip13 = '',
    this.dip23 = '',
  });
  String UserID;
  String InstrumentID;
  String Barcode;
  String DataPreview;
  String W11;
  String W12;
  String W13;
  String A01;
  String isW1;
  String W21;
  String W22;
  String W23;
  String A02;
  String isW2;
  String W31;
  String W32;
  String W33;
  String A03;
  String isW3;
  String Result;

  String SPEChi;
  String SPEClow;
  String SEND;

  String dip12;
  String dip13;
  String dip23;
}
