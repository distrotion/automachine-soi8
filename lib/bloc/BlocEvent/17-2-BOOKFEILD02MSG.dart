import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/17BOOKFEILD02/BOOKFEILD02MAIN.dart';
import '../../page/17BOOKFEILD02/BOOKFEILD02VAR.dart';
import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';
import '17-1-BOOKFEILD02Bloc.dart';

//-------------------------------------------------
String server = serverG;

abstract class BOOKFEILD02MSG_Event {}

class BOOKFEILD02MSG_UserID extends BOOKFEILD02MSG_Event {}

class BOOKFEILD02MSG_Instrument extends BOOKFEILD02MSG_Event {}

class BOOKFEILD02MSG_Barcode extends BOOKFEILD02MSG_Event {}

class BOOKFEILD02MSG_Select_Send extends BOOKFEILD02MSG_Event {}

class BOOKFEILD02MSG_Reject extends BOOKFEILD02MSG_Event {}

class BOOKFEILD02MSG_clear extends BOOKFEILD02MSG_Event {}

class BOOKFEILD02MSG_Flush extends BOOKFEILD02MSG_Event {}

class BOOKFEILD02MSG_Bloc extends Bloc<BOOKFEILD02MSG_Event, String> {
  BOOKFEILD02MSG_Bloc() : super('') {
    on<BOOKFEILD02MSG_UserID>((event, emit) {
      return _BOOKFEILD02MSG_UserID('', emit);
    });

    on<BOOKFEILD02MSG_Instrument>((event, emit) {
      return _BOOKFEILD02MSG_Instrument('', emit);
    });

    on<BOOKFEILD02MSG_Barcode>((event, emit) {
      return _BOOKFEILD02MSG_Barcode('', emit);
    });

    on<BOOKFEILD02MSG_Select_Send>((event, emit) {
      return _BOOKFEILD02MSG_Select_Send('', emit);
    });

    on<BOOKFEILD02MSG_Reject>((event, emit) {
      return _BOOKFEILD02MSG_Reject('', emit);
    });

    on<BOOKFEILD02MSG_clear>((event, emit) {
      return _BOOKFEILD02MSG_clear('', emit);
    });

    on<BOOKFEILD02MSG_Flush>((event, emit) {
      return _BOOKFEILD02MSG_Flush('', emit);
    });
  }
  Future<void> _BOOKFEILD02MSG_UserID(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BOOKFEILD02MAINcontext);

    final response = await Dio().post(
      server + "setUserID_BOOKFEILD02",
      data: {"UserID": BOOKFEILD02VAR.UserID},
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

    Navigator.pop(BOOKFEILD02MAINcontext);
    BOOKFEILD02MAINcontext.read<BOOKFEILD02Bloc_Bloc>()
        .add(BOOKFEILD02Bloc_Read());
    emit(output);
  }

  Future<void> _BOOKFEILD02MSG_Instrument(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BOOKFEILD02MAINcontext);

    final response = await Dio().post(
      server + "setInstrumentID_BOOKFEILD02",
      data: {
        "InstrumentID": BOOKFEILD02VAR.InstrumentID,
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

    Navigator.pop(BOOKFEILD02MAINcontext);
    BOOKFEILD02MAINcontext.read<BOOKFEILD02Bloc_Bloc>()
        .add(BOOKFEILD02Bloc_Read());
    emit(output);
  }

  Future<void> _BOOKFEILD02MSG_Barcode(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BOOKFEILD02MAINcontext);

    final response = await Dio().post(
      server + "setBarcode_BOOKFEILD02",
      data: {
        "Barcode": BOOKFEILD02VAR.Barcode,
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

    Navigator.pop(BOOKFEILD02MAINcontext);
    BOOKFEILD02MAINcontext.read<BOOKFEILD02Bloc_Bloc>()
        .add(BOOKFEILD02Bloc_Read());
    emit(output);
  }

  Future<void> _BOOKFEILD02MSG_Select_W1(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BOOKFEILD02MAINcontext);

    final response = await Dio().post(
      server + "BOOKFEILD02_W1",
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

    Navigator.pop(BOOKFEILD02MAINcontext);
    BOOKFEILD02MAINcontext.read<BOOKFEILD02Bloc_Bloc>()
        .add(BOOKFEILD02Bloc_Read());
    emit(output);
  }

  Future<void> _BOOKFEILD02MSG_Select_Send(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BOOKFEILD02MAINcontext);

    final response = await Dio().post(
      server + "BOOKFEILD02_SEND",
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

    Navigator.pop(BOOKFEILD02MAINcontext);
    BOOKFEILD02MAINcontext.read<BOOKFEILD02Bloc_Bloc>()
        .add(BOOKFEILD02Bloc_Read());
    emit(output);
  }

  Future<void> _BOOKFEILD02MSG_Reject(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BOOKFEILD02MAINcontext);

    final response = await Dio().post(
      server + "BOOKFEILD02_REJ",
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

    Navigator.pop(BOOKFEILD02MAINcontext);
    BOOKFEILD02MAINcontext.read<BOOKFEILD02Bloc_Bloc>()
        .add(BOOKFEILD02Bloc_Read());
    emit(output);
  }

  Future<void> _BOOKFEILD02MSG_clear(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BOOKFEILD02MAINcontext);

    final response = await Dio().post(
      server + "BOOKFEILD02_clear",
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

    Navigator.pop(BOOKFEILD02MAINcontext);
    BOOKFEILD02MAINcontext.read<BOOKFEILD02Bloc_Bloc>()
        .add(BOOKFEILD02Bloc_Read());
    emit(output);
  }

  Future<void> _BOOKFEILD02MSG_Flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
