import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/08SG/SGMAIN.dart';
import '../../page/08SG/SGVAR.dart';
import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';
import '08-1-SGBloc.dart';

//-------------------------------------------------
String server = serverG;

abstract class SGMSG_Event {}

class SGMSG_UserID extends SGMSG_Event {}

class SGMSG_Instrument extends SGMSG_Event {}

class SGMSG_Barcode extends SGMSG_Event {}

class SGMSG_Select_Send extends SGMSG_Event {}

class SGMSG_Reject extends SGMSG_Event {}

class SGMSG_clear extends SGMSG_Event {}

class SGMSG_Flush extends SGMSG_Event {}

class SGMSG_Bloc extends Bloc<SGMSG_Event, String> {
  SGMSG_Bloc() : super('') {
    on<SGMSG_UserID>((event, emit) {
      return _SGMSG_UserID('', emit);
    });

    on<SGMSG_Instrument>((event, emit) {
      return _SGMSG_Instrument('', emit);
    });

    on<SGMSG_Barcode>((event, emit) {
      return _SGMSG_Barcode('', emit);
    });

    on<SGMSG_Select_Send>((event, emit) {
      return _SGMSG_Select_Send('', emit);
    });

    on<SGMSG_Reject>((event, emit) {
      return _SGMSG_Reject('', emit);
    });

    on<SGMSG_clear>((event, emit) {
      return _SGMSG_clear('', emit);
    });

    on<SGMSG_Flush>((event, emit) {
      return _SGMSG_Flush('', emit);
    });
  }
  Future<void> _SGMSG_UserID(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(SGMAINcontext);

    final response = await Dio().post(
      server + "setUserID_SG",
      data: {"UserID": SGVAR.UserID},
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

    Navigator.pop(SGMAINcontext);
    SGMAINcontext.read<SGBloc_Bloc>().add(SGBloc_Read());
    emit(output);
  }

  Future<void> _SGMSG_Instrument(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(SGMAINcontext);

    final response = await Dio().post(
      server + "setInstrumentID_SG",
      data: {
        "InstrumentID": SGVAR.InstrumentID,
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

    Navigator.pop(SGMAINcontext);
    SGMAINcontext.read<SGBloc_Bloc>().add(SGBloc_Read());
    emit(output);
  }

  Future<void> _SGMSG_Barcode(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(SGMAINcontext);

    final response = await Dio().post(
      server + "setBarcode_SG",
      data: {
        "Barcode": SGVAR.Barcode,
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

    Navigator.pop(SGMAINcontext);
    SGMAINcontext.read<SGBloc_Bloc>().add(SGBloc_Read());
    emit(output);
  }

  Future<void> _SGMSG_Select_W1(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(SGMAINcontext);

    final response = await Dio().post(
      server + "SG_W1",
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

    Navigator.pop(SGMAINcontext);
    SGMAINcontext.read<SGBloc_Bloc>().add(SGBloc_Read());
    emit(output);
  }

  Future<void> _SGMSG_Select_Send(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(SGMAINcontext);

    final response = await Dio().post(
      server + "SG_SEND",
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

    Navigator.pop(SGMAINcontext);
    SGMAINcontext.read<SGBloc_Bloc>().add(SGBloc_Read());
    emit(output);
  }

  Future<void> _SGMSG_Reject(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(SGMAINcontext);

    final response = await Dio().post(
      server + "SG_REJ",
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

    Navigator.pop(SGMAINcontext);
    SGMAINcontext.read<SGBloc_Bloc>().add(SGBloc_Read());
    emit(output);
  }

  Future<void> _SGMSG_clear(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(SGMAINcontext);

    final response = await Dio().post(
      server + "SG_clear",
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

    Navigator.pop(SGMAINcontext);
    SGMAINcontext.read<SGBloc_Bloc>().add(SGBloc_Read());
    emit(output);
  }

  Future<void> _SGMSG_Flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
