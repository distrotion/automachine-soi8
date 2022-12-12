import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/13PARTICALSIZE/PARTICALSIZEMAIN.dart';
import '../../page/13PARTICALSIZE/PARTICALSIZEVAR.dart';

import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';
import '13-1-PARTICALSIZEBloc.dart';

//-------------------------------------------------
String server = serverG;

abstract class PATICLESIZEMSG_Event {}

class PATICLESIZEMSG_UserID extends PATICLESIZEMSG_Event {}

class PATICLESIZEMSG_Instrument extends PATICLESIZEMSG_Event {}

class PATICLESIZEMSG_Barcode extends PATICLESIZEMSG_Event {}

class PATICLESIZEMSG_Select_Send extends PATICLESIZEMSG_Event {}

class PATICLESIZEMSG_Reject extends PATICLESIZEMSG_Event {}

class PATICLESIZEMSG_clear extends PATICLESIZEMSG_Event {}

class PATICLESIZEMSG_Flush extends PATICLESIZEMSG_Event {}

class PATICLESIZEMSG_Bloc extends Bloc<PATICLESIZEMSG_Event, String> {
  PATICLESIZEMSG_Bloc() : super('') {
    on<PATICLESIZEMSG_UserID>((event, emit) {
      return _PATICLESIZEMSG_UserID('', emit);
    });

    on<PATICLESIZEMSG_Instrument>((event, emit) {
      return _PATICLESIZEMSG_Instrument('', emit);
    });

    on<PATICLESIZEMSG_Barcode>((event, emit) {
      return _PATICLESIZEMSG_Barcode('', emit);
    });

    on<PATICLESIZEMSG_Select_Send>((event, emit) {
      return _PATICLESIZEMSG_Select_Send('', emit);
    });

    on<PATICLESIZEMSG_Reject>((event, emit) {
      return _PATICLESIZEMSG_Reject('', emit);
    });

    on<PATICLESIZEMSG_clear>((event, emit) {
      return _PATICLESIZEMSG_clear('', emit);
    });

    on<PATICLESIZEMSG_Flush>((event, emit) {
      return _PATICLESIZEMSG_Flush('', emit);
    });
  }
  Future<void> _PATICLESIZEMSG_UserID(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PATICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "setUserID_PATICLESIZE",
      data: {"UserID": PATICLESIZEVAR.UserID},
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      if (databuff != null) {
        if (databuff.toString() == 'OK') {
          //
          output = 'OK';
        } else {
          output = 'NOK';
        }
      }
    }

    Navigator.pop(PATICLESIZEMAINcontext);
    PATICLESIZEMAINcontext.read<PATICLESIZEBloc_Bloc>()
        .add(PATICLESIZEBloc_Read());
    emit(output);
  }

  Future<void> _PATICLESIZEMSG_Instrument(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PATICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "setInstrumentID_PATICLESIZE",
      data: {
        "InstrumentID": PATICLESIZEVAR.InstrumentID,
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      if (databuff != null) {
        if (databuff.toString() == 'OK') {
          //
          output = 'OK';
        } else {
          output = 'NOK';
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "Error", "WRONG MATCHINE", enumNotificationlist.Error);
        }
      }
    }

    Navigator.pop(PATICLESIZEMAINcontext);
    PATICLESIZEMAINcontext.read<PATICLESIZEBloc_Bloc>()
        .add(PATICLESIZEBloc_Read());
    emit(output);
  }

  Future<void> _PATICLESIZEMSG_Barcode(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PATICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "setBarcode_PATICLESIZE",
      data: {
        "Barcode": PATICLESIZEVAR.Barcode,
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff.toString() == 'NOK-REJ-FIRST');
      if (databuff != null) {
        if (databuff.toString() == 'OK') {
          //
          output = 'OK';
        } else {
          output = 'NOK';
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "Error",
              "This PO have not registed yet",
              enumNotificationlist.Error);
        }
      }
    }

    Navigator.pop(PATICLESIZEMAINcontext);
    PATICLESIZEMAINcontext.read<PATICLESIZEBloc_Bloc>()
        .add(PATICLESIZEBloc_Read());
    emit(output);
  }

  Future<void> _PATICLESIZEMSG_Select_W1(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PATICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "PATICLESIZE_W1",
      data: {},
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff.toString() == 'NOK-REJ-FIRST');
      if (databuff != null) {
        if (databuff.toString() == 'OK') {
          //
          output = 'OK';
        } else {
          output = 'NOK';
        }
      }
    }

    Navigator.pop(PATICLESIZEMAINcontext);
    PATICLESIZEMAINcontext.read<PATICLESIZEBloc_Bloc>()
        .add(PATICLESIZEBloc_Read());
    emit(output);
  }

  Future<void> _PATICLESIZEMSG_Select_Send(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PATICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "PATICLESIZE_SEND",
      data: {},
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      if (databuff != null) {
        if (databuff.toString() == 'OK') {
          //
          output = 'OK';
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "OK", "DATA HAVE SENT", enumNotificationlist.Success);
        } else {
          output = 'NOK';
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "NOK", "SOMETHING WORNG", enumNotificationlist.Error);
        }
      }
    }

    Navigator.pop(PATICLESIZEMAINcontext);
    PATICLESIZEMAINcontext.read<PATICLESIZEBloc_Bloc>()
        .add(PATICLESIZEBloc_Read());
    emit(output);
  }

  Future<void> _PATICLESIZEMSG_Reject(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PATICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "PATICLESIZE_REJ",
      data: {},
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      if (databuff != null) {
        if (databuff.toString() == 'OK') {
          //
          output = 'OK';
        } else {
          output = 'NOK';
        }
      }
    }

    Navigator.pop(PATICLESIZEMAINcontext);
    PATICLESIZEMAINcontext.read<PATICLESIZEBloc_Bloc>()
        .add(PATICLESIZEBloc_Read());
    emit(output);
  }

  Future<void> _PATICLESIZEMSG_clear(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PATICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "PATICLESIZE_clear",
      data: {},
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      if (databuff != null) {
        if (databuff.toString() == 'OK') {
          //
          output = 'OK';
        } else {
          output = 'NOK';
        }
      }
    }

    Navigator.pop(PATICLESIZEMAINcontext);
    PATICLESIZEMAINcontext.read<PATICLESIZEBloc_Bloc>()
        .add(PATICLESIZEBloc_Read());
    emit(output);
  }

  Future<void> _PATICLESIZEMSG_Flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
