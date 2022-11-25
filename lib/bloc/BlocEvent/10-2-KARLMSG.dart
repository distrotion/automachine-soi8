import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/10KARL/KARLMAIN.dart';
import '../../page/10KARL/KARLVAR.dart';
import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';
import '10-1-KARLBloc.dart';

//-------------------------------------------------
String server = serverG;

abstract class KARLMSG_Event {}

class KARLMSG_UserID extends KARLMSG_Event {}

class KARLMSG_Instrument extends KARLMSG_Event {}

class KARLMSG_Barcode extends KARLMSG_Event {}

class KARLMSG_Select_Send extends KARLMSG_Event {}

class KARLMSG_Reject extends KARLMSG_Event {}

class KARLMSG_clear extends KARLMSG_Event {}

class KARLMSG_Flush extends KARLMSG_Event {}

class KARLMSG_Bloc extends Bloc<KARLMSG_Event, String> {
  KARLMSG_Bloc() : super('') {
    on<KARLMSG_UserID>((event, emit) {
      return _KARLMSG_UserID('', emit);
    });

    on<KARLMSG_Instrument>((event, emit) {
      return _KARLMSG_Instrument('', emit);
    });

    on<KARLMSG_Barcode>((event, emit) {
      return _KARLMSG_Barcode('', emit);
    });

    on<KARLMSG_Select_Send>((event, emit) {
      return _KARLMSG_Select_Send('', emit);
    });

    on<KARLMSG_Reject>((event, emit) {
      return _KARLMSG_Reject('', emit);
    });

    on<KARLMSG_clear>((event, emit) {
      return _KARLMSG_clear('', emit);
    });

    on<KARLMSG_Flush>((event, emit) {
      return _KARLMSG_Flush('', emit);
    });
  }
  Future<void> _KARLMSG_UserID(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(KARLMAINcontext);

    final response = await Dio().post(
      server + "setUserID_KARL",
      data: {"UserID": KARLVAR.UserID},
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

    Navigator.pop(KARLMAINcontext);
    KARLMAINcontext.read<KARLBloc_Bloc>().add(KARLBloc_Read());
    emit(output);
  }

  Future<void> _KARLMSG_Instrument(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(KARLMAINcontext);

    final response = await Dio().post(
      server + "setInstrumentID_KARL",
      data: {
        "InstrumentID": KARLVAR.InstrumentID,
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

    Navigator.pop(KARLMAINcontext);
    KARLMAINcontext.read<KARLBloc_Bloc>().add(KARLBloc_Read());
    emit(output);
  }

  Future<void> _KARLMSG_Barcode(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(KARLMAINcontext);

    final response = await Dio().post(
      server + "setBarcode_KARL",
      data: {
        "Barcode": KARLVAR.Barcode,
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

    Navigator.pop(KARLMAINcontext);
    KARLMAINcontext.read<KARLBloc_Bloc>().add(KARLBloc_Read());
    emit(output);
  }

  Future<void> _KARLMSG_Select_W1(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(KARLMAINcontext);

    final response = await Dio().post(
      server + "KARL_W1",
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

    Navigator.pop(KARLMAINcontext);
    KARLMAINcontext.read<KARLBloc_Bloc>().add(KARLBloc_Read());
    emit(output);
  }

  Future<void> _KARLMSG_Select_Send(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(KARLMAINcontext);

    final response = await Dio().post(
      server + "KARL_SEND",
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

    Navigator.pop(KARLMAINcontext);
    KARLMAINcontext.read<KARLBloc_Bloc>().add(KARLBloc_Read());
    emit(output);
  }

  Future<void> _KARLMSG_Reject(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(KARLMAINcontext);

    final response = await Dio().post(
      server + "KARL_REJ",
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

    Navigator.pop(KARLMAINcontext);
    KARLMAINcontext.read<KARLBloc_Bloc>().add(KARLBloc_Read());
    emit(output);
  }

  Future<void> _KARLMSG_clear(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(KARLMAINcontext);

    final response = await Dio().post(
      server + "KARL_clear",
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

    Navigator.pop(KARLMAINcontext);
    KARLMAINcontext.read<KARLBloc_Bloc>().add(KARLBloc_Read());
    emit(output);
  }

  Future<void> _KARLMSG_Flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
