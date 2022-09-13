import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------
String server = serverG;

abstract class SCCMSG_Event {}

class SCCMSG_UserID extends SCCMSG_Event {}

class SCCMSG_Instrument extends SCCMSG_Event {}

class SCCMSG_Barcode extends SCCMSG_Event {}

class SCCMSG_Select_Send extends SCCMSG_Event {}

class SCCMSG_Reject extends SCCMSG_Event {}

class SCCMSG_clear extends SCCMSG_Event {}

class SCCMSG_Flush extends SCCMSG_Event {}

class SCCMSG_Bloc extends Bloc<SCCMSG_Event, String> {
  SCCMSG_Bloc() : super('') {
    on<SCCMSG_UserID>((event, emit) {
      return _SCCMSG_UserID('', emit);
    });

    on<SCCMSG_Instrument>((event, emit) {
      return _SCCMSG_Instrument('', emit);
    });
    on<SCCMSG_Barcode>((event, emit) {
      return _SCCMSG_Barcode('', emit);
    });

    on<SCCMSG_Select_Send>((event, emit) {
      return _SCCMSG_Select_Send('', emit);
    });

    on<SCCMSG_Reject>((event, emit) {
      return _SCCMSG_Reject('', emit);
    });

    on<SCCMSG_clear>((event, emit) {
      return _SCCMSG_clear('', emit);
    });

    on<SCCMSG_Flush>((event, emit) {
      return _SCCMSG_Flush('', emit);
    });
  }
  Future<void> _SCCMSG_UserID(String toAdd, Emitter<String> emit) async {
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

  Future<void> _SCCMSG_Instrument(String toAdd, Emitter<String> emit) async {
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

  Future<void> _SCCMSG_Barcode(String toAdd, Emitter<String> emit) async {
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

  Future<void> _SCCMSG_Select_W1(String toAdd, Emitter<String> emit) async {
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

  Future<void> _SCCMSG_Select_Send(String toAdd, Emitter<String> emit) async {
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

  Future<void> _SCCMSG_Reject(String toAdd, Emitter<String> emit) async {
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

  Future<void> _SCCMSG_clear(String toAdd, Emitter<String> emit) async {
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

  Future<void> _SCCMSG_Flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
