import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------
String server = serverG;

abstract class COCMSG_Event {}

class COCMSG_UserID extends COCMSG_Event {}

class COCMSG_Instrument extends COCMSG_Event {}

class COCMSG_Barcode extends COCMSG_Event {}

class COCMSG_Select_Send extends COCMSG_Event {}

class COCMSG_Reject extends COCMSG_Event {}

class COCMSG_clear extends COCMSG_Event {}

class COCMSG_Flush extends COCMSG_Event {}

class COCMSG_Bloc extends Bloc<COCMSG_Event, String> {
  COCMSG_Bloc() : super('') {
    on<COCMSG_UserID>((event, emit) {
      return _COCMSG_UserID('', emit);
    });

    on<COCMSG_Instrument>((event, emit) {
      return _COCMSG_Instrument('', emit);
    });
    on<COCMSG_Barcode>((event, emit) {
      return _COCMSG_Barcode('', emit);
    });

    on<COCMSG_Select_Send>((event, emit) {
      return _COCMSG_Select_Send('', emit);
    });

    on<COCMSG_Reject>((event, emit) {
      return _COCMSG_Reject('', emit);
    });

    on<COCMSG_clear>((event, emit) {
      return _COCMSG_clear('', emit);
    });

    on<COCMSG_Flush>((event, emit) {
      return _COCMSG_Flush('', emit);
    });
  }
  Future<void> _COCMSG_UserID(String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      server + "setUserID_WBA01",
      data: {"UserID": ''},
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

    emit(output);
  }

  Future<void> _COCMSG_Instrument(String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      server + "setInstrumentID_WBA01",
      data: {
        "InstrumentID": '',
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

    emit(output);
  }

  Future<void> _COCMSG_Barcode(String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      server + "setBarcode_WBA01",
      data: {
        "Barcode": '',
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

    emit(output);
  }

  Future<void> _COCMSG_Select_W1(String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      server + "WBA01_W1",
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

    emit(output);
  }

  Future<void> _COCMSG_Select_Send(String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      server + "WBA01_SEND",
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

    emit(output);
  }

  Future<void> _COCMSG_Reject(String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      server + "WBA01_REJ",
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

    emit(output);
  }

  Future<void> _COCMSG_clear(String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      server + "WBA01_clear",
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

    emit(output);
  }

  Future<void> _COCMSG_Flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
