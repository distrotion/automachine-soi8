import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/16BOOKFEILD01/BOOKFEILD01MAIN.dart';
import '../../page/16BOOKFEILD01/BOOKFEILD01VAR.dart';
import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';
import '16-1-BOOKFEILD01Bloc.dart';

//-------------------------------------------------
String server = serverG;

abstract class BOOKFEILD01MSG_Event {}

class BOOKFEILD01MSG_UserID extends BOOKFEILD01MSG_Event {}

class BOOKFEILD01MSG_Instrument extends BOOKFEILD01MSG_Event {}

class BOOKFEILD01MSG_Barcode extends BOOKFEILD01MSG_Event {}

class BOOKFEILD01MSG_Select_Send extends BOOKFEILD01MSG_Event {}

class BOOKFEILD01MSG_Reject extends BOOKFEILD01MSG_Event {}

class BOOKFEILD01MSG_clear extends BOOKFEILD01MSG_Event {}

class BOOKFEILD01MSG_Flush extends BOOKFEILD01MSG_Event {}

class BOOKFEILD01MSG_Bloc extends Bloc<BOOKFEILD01MSG_Event, String> {
  BOOKFEILD01MSG_Bloc() : super('') {
    on<BOOKFEILD01MSG_UserID>((event, emit) {
      return _BOOKFEILD01MSG_UserID('', emit);
    });

    on<BOOKFEILD01MSG_Instrument>((event, emit) {
      return _BOOKFEILD01MSG_Instrument('', emit);
    });

    on<BOOKFEILD01MSG_Barcode>((event, emit) {
      return _BOOKFEILD01MSG_Barcode('', emit);
    });

    on<BOOKFEILD01MSG_Select_Send>((event, emit) {
      return _BOOKFEILD01MSG_Select_Send('', emit);
    });

    on<BOOKFEILD01MSG_Reject>((event, emit) {
      return _BOOKFEILD01MSG_Reject('', emit);
    });

    on<BOOKFEILD01MSG_clear>((event, emit) {
      return _BOOKFEILD01MSG_clear('', emit);
    });

    on<BOOKFEILD01MSG_Flush>((event, emit) {
      return _BOOKFEILD01MSG_Flush('', emit);
    });
  }
  Future<void> _BOOKFEILD01MSG_UserID(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BOOKFEILD01MAINcontext);

    final response = await Dio().post(
      server + "setUserID_BOOKFEILD01",
      data: {"UserID": BOOKFEILD01VAR.UserID},
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

    Navigator.pop(BOOKFEILD01MAINcontext);
    BOOKFEILD01MAINcontext.read<BOOKFEILD01Bloc_Bloc>()
        .add(BOOKFEILD01Bloc_Read());
    emit(output);
  }

  Future<void> _BOOKFEILD01MSG_Instrument(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BOOKFEILD01MAINcontext);

    final response = await Dio().post(
      server + "setInstrumentID_BOOKFEILD01",
      data: {
        "InstrumentID": BOOKFEILD01VAR.InstrumentID,
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

    Navigator.pop(BOOKFEILD01MAINcontext);
    BOOKFEILD01MAINcontext.read<BOOKFEILD01Bloc_Bloc>()
        .add(BOOKFEILD01Bloc_Read());
    emit(output);
  }

  Future<void> _BOOKFEILD01MSG_Barcode(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BOOKFEILD01MAINcontext);

    final response = await Dio().post(
      server + "setBarcode_BOOKFEILD01",
      data: {
        "Barcode": BOOKFEILD01VAR.Barcode,
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

    Navigator.pop(BOOKFEILD01MAINcontext);
    BOOKFEILD01MAINcontext.read<BOOKFEILD01Bloc_Bloc>()
        .add(BOOKFEILD01Bloc_Read());
    emit(output);
  }

  Future<void> _BOOKFEILD01MSG_Select_W1(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BOOKFEILD01MAINcontext);

    final response = await Dio().post(
      server + "BOOKFEILD01_W1",
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

    Navigator.pop(BOOKFEILD01MAINcontext);
    BOOKFEILD01MAINcontext.read<BOOKFEILD01Bloc_Bloc>()
        .add(BOOKFEILD01Bloc_Read());
    emit(output);
  }

  Future<void> _BOOKFEILD01MSG_Select_Send(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BOOKFEILD01MAINcontext);

    final response = await Dio().post(
      server + "BOOKFEILD01_SEND",
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

    Navigator.pop(BOOKFEILD01MAINcontext);
    BOOKFEILD01MAINcontext.read<BOOKFEILD01Bloc_Bloc>()
        .add(BOOKFEILD01Bloc_Read());
    emit(output);
  }

  Future<void> _BOOKFEILD01MSG_Reject(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BOOKFEILD01MAINcontext);

    final response = await Dio().post(
      server + "BOOKFEILD01_REJ",
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

    Navigator.pop(BOOKFEILD01MAINcontext);
    BOOKFEILD01MAINcontext.read<BOOKFEILD01Bloc_Bloc>()
        .add(BOOKFEILD01Bloc_Read());
    emit(output);
  }

  Future<void> _BOOKFEILD01MSG_clear(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BOOKFEILD01MAINcontext);

    final response = await Dio().post(
      server + "BOOKFEILD01_clear",
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

    Navigator.pop(BOOKFEILD01MAINcontext);
    BOOKFEILD01MAINcontext.read<BOOKFEILD01Bloc_Bloc>()
        .add(BOOKFEILD01Bloc_Read());
    emit(output);
  }

  Future<void> _BOOKFEILD01MSG_Flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
