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

abstract class PARTICLESIZEMSG_Event {}

class PARTICLESIZEMSG_UserID extends PARTICLESIZEMSG_Event {}

class PARTICLESIZEMSG_Instrument extends PARTICLESIZEMSG_Event {}

class PARTICLESIZEMSG_Barcode extends PARTICLESIZEMSG_Event {}

class PARTICLESIZEMSG_Select_Send extends PARTICLESIZEMSG_Event {}

class PARTICLESIZEMSG_Reject extends PARTICLESIZEMSG_Event {}

class PARTICLESIZEMSG_clear extends PARTICLESIZEMSG_Event {}

class PARTICLESIZEMSG_Flush extends PARTICLESIZEMSG_Event {}

class PARTICLESIZEMSG_Bloc extends Bloc<PARTICLESIZEMSG_Event, String> {
  PARTICLESIZEMSG_Bloc() : super('') {
    on<PARTICLESIZEMSG_UserID>((event, emit) {
      return _PARTICLESIZEMSG_UserID('', emit);
    });

    on<PARTICLESIZEMSG_Instrument>((event, emit) {
      return _PARTICLESIZEMSG_Instrument('', emit);
    });

    on<PARTICLESIZEMSG_Barcode>((event, emit) {
      return _PARTICLESIZEMSG_Barcode('', emit);
    });

    on<PARTICLESIZEMSG_Select_Send>((event, emit) {
      return _PARTICLESIZEMSG_Select_Send('', emit);
    });

    on<PARTICLESIZEMSG_Reject>((event, emit) {
      return _PARTICLESIZEMSG_Reject('', emit);
    });

    on<PARTICLESIZEMSG_clear>((event, emit) {
      return _PARTICLESIZEMSG_clear('', emit);
    });

    on<PARTICLESIZEMSG_Flush>((event, emit) {
      return _PARTICLESIZEMSG_Flush('', emit);
    });
  }
  Future<void> _PARTICLESIZEMSG_UserID(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PARTICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "setUserID_PARTICLESIZE",
      data: {"UserID": PARTICLESIZEVAR.UserID},
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

    Navigator.pop(PARTICLESIZEMAINcontext);
    PARTICLESIZEMAINcontext.read<PARTICLESIZEBloc_Bloc>()
        .add(PARTICLESIZEBloc_Read());
    emit(output);
  }

  Future<void> _PARTICLESIZEMSG_Instrument(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PARTICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "setInstrumentID_PARTICLESIZE",
      data: {
        "InstrumentID": PARTICLESIZEVAR.InstrumentID,
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

    Navigator.pop(PARTICLESIZEMAINcontext);
    PARTICLESIZEMAINcontext.read<PARTICLESIZEBloc_Bloc>()
        .add(PARTICLESIZEBloc_Read());
    emit(output);
  }

  Future<void> _PARTICLESIZEMSG_Barcode(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PARTICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "setBarcode_PARTICLESIZE",
      data: {
        "Barcode": PARTICLESIZEVAR.Barcode,
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

    Navigator.pop(PARTICLESIZEMAINcontext);
    PARTICLESIZEMAINcontext.read<PARTICLESIZEBloc_Bloc>()
        .add(PARTICLESIZEBloc_Read());
    emit(output);
  }

  Future<void> _PARTICLESIZEMSG_Select_W1(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PARTICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "PARTICLESIZE_W1",
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

    Navigator.pop(PARTICLESIZEMAINcontext);
    PARTICLESIZEMAINcontext.read<PARTICLESIZEBloc_Bloc>()
        .add(PARTICLESIZEBloc_Read());
    emit(output);
  }

  Future<void> _PARTICLESIZEMSG_Select_Send(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PARTICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "PARTICLESIZE_SEND",
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

    Navigator.pop(PARTICLESIZEMAINcontext);
    PARTICLESIZEMAINcontext.read<PARTICLESIZEBloc_Bloc>()
        .add(PARTICLESIZEBloc_Read());
    emit(output);
  }

  Future<void> _PARTICLESIZEMSG_Reject(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PARTICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "PARTICLESIZE_REJ",
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

    Navigator.pop(PARTICLESIZEMAINcontext);
    PARTICLESIZEMAINcontext.read<PARTICLESIZEBloc_Bloc>()
        .add(PARTICLESIZEBloc_Read());
    emit(output);
  }

  Future<void> _PARTICLESIZEMSG_clear(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PARTICLESIZEMAINcontext);

    final response = await Dio().post(
      server + "PARTICLESIZE_clear",
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

    Navigator.pop(PARTICLESIZEMAINcontext);
    PARTICLESIZEMAINcontext.read<PARTICLESIZEBloc_Bloc>()
        .add(PARTICLESIZEBloc_Read());
    emit(output);
  }

  Future<void> _PARTICLESIZEMSG_Flush(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
