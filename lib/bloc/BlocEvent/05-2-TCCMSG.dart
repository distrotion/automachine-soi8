import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------
String server = serverG;

abstract class TCCMSG_Event {}

class TCCMSG_UserID extends TCCMSG_Event {}

class TCCMSG_Instrument extends TCCMSG_Event {}

class TCCMSG_Barcode extends TCCMSG_Event {}

class TCCMSG_Select_Send extends TCCMSG_Event {}

class TCCMSG_Reject extends TCCMSG_Event {}

class TCCMSG_clear extends TCCMSG_Event {}

class TCCMSG_Flush extends TCCMSG_Event {}

class TCCMSG_Bloc extends Bloc<TCCMSG_Event, String> {
  TCCMSG_Bloc() : super('') {
    on<TCCMSG_UserID>((event, emit) {
      return _TCCMSG_UserID('', emit);
    });

    on<TCCMSG_Instrument>((event, emit) {
      return _TCCMSG_Instrument('', emit);
    });
    on<TCCMSG_Barcode>((event, emit) {
      return _TCCMSG_Barcode('', emit);
    });

    on<TCCMSG_Select_Send>((event, emit) {
      return _TCCMSG_Select_Send('', emit);
    });

    on<TCCMSG_Reject>((event, emit) {
      return _TCCMSG_Reject('', emit);
    });

    on<TCCMSG_clear>((event, emit) {
      return _TCCMSG_clear('', emit);
    });

    on<TCCMSG_Flush>((event, emit) {
      return _TCCMSG_Flush('', emit);
    });
  }
  Future<void> _TCCMSG_UserID(String toAdd, Emitter<String> emit) async {
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

  Future<void> _TCCMSG_Instrument(String toAdd, Emitter<String> emit) async {
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

  Future<void> _TCCMSG_Barcode(String toAdd, Emitter<String> emit) async {
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

  Future<void> _TCCMSG_Select_W1(String toAdd, Emitter<String> emit) async {
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

  Future<void> _TCCMSG_Select_Send(String toAdd, Emitter<String> emit) async {
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

  Future<void> _TCCMSG_Reject(String toAdd, Emitter<String> emit) async {
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

  Future<void> _TCCMSG_clear(String toAdd, Emitter<String> emit) async {
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

  Future<void> _TCCMSG_Flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
