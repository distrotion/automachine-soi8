import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/14MINIAV/MINIAVMAIN.dart';
import '../../page/14MINIAV/MINIAVVAR.dart';
import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';
import '14-1-MINIAVBloc.dart';

//-------------------------------------------------
String server = serverG;

abstract class MINIAVMSG_Event {}

class MINIAVMSG_UserID extends MINIAVMSG_Event {}

class MINIAVMSG_Instrument extends MINIAVMSG_Event {}

class MINIAVMSG_Barcode extends MINIAVMSG_Event {}

class MINIAVMSG_Select_Send extends MINIAVMSG_Event {}

class MINIAVMSG_Reject extends MINIAVMSG_Event {}

class MINIAVMSG_clear extends MINIAVMSG_Event {}

class MINIAVMSG_Flush extends MINIAVMSG_Event {}

class MINIAVMSG_Bloc extends Bloc<MINIAVMSG_Event, String> {
  MINIAVMSG_Bloc() : super('') {
    on<MINIAVMSG_UserID>((event, emit) {
      return _MINIAVMSG_UserID('', emit);
    });

    on<MINIAVMSG_Instrument>((event, emit) {
      return _MINIAVMSG_Instrument('', emit);
    });

    on<MINIAVMSG_Barcode>((event, emit) {
      return _MINIAVMSG_Barcode('', emit);
    });

    on<MINIAVMSG_Select_Send>((event, emit) {
      return _MINIAVMSG_Select_Send('', emit);
    });

    on<MINIAVMSG_Reject>((event, emit) {
      return _MINIAVMSG_Reject('', emit);
    });

    on<MINIAVMSG_clear>((event, emit) {
      return _MINIAVMSG_clear('', emit);
    });

    on<MINIAVMSG_Flush>((event, emit) {
      return _MINIAVMSG_Flush('', emit);
    });
  }
  Future<void> _MINIAVMSG_UserID(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(MINIAVMAINcontext);

    final response = await Dio().post(
      server + "setUserID_MINIAV",
      data: {"UserID": MINIAVVAR.UserID},
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

    Navigator.pop(MINIAVMAINcontext);
    MINIAVMAINcontext.read<MINIAVBloc_Bloc>().add(MINIAVBloc_Read());
    emit(output);
  }

  Future<void> _MINIAVMSG_Instrument(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(MINIAVMAINcontext);

    final response = await Dio().post(
      server + "setInstrumentID_MINIAV",
      data: {
        "InstrumentID": MINIAVVAR.InstrumentID,
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

    Navigator.pop(MINIAVMAINcontext);
    MINIAVMAINcontext.read<MINIAVBloc_Bloc>().add(MINIAVBloc_Read());
    emit(output);
  }

  Future<void> _MINIAVMSG_Barcode(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(MINIAVMAINcontext);

    final response = await Dio().post(
      server + "setBarcode_MINIAV",
      data: {
        "Barcode": MINIAVVAR.Barcode,
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

    Navigator.pop(MINIAVMAINcontext);
    MINIAVMAINcontext.read<MINIAVBloc_Bloc>().add(MINIAVBloc_Read());
    emit(output);
  }

  Future<void> _MINIAVMSG_Select_W1(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(MINIAVMAINcontext);

    final response = await Dio().post(
      server + "MINIAV_W1",
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

    Navigator.pop(MINIAVMAINcontext);
    MINIAVMAINcontext.read<MINIAVBloc_Bloc>().add(MINIAVBloc_Read());
    emit(output);
  }

  Future<void> _MINIAVMSG_Select_Send(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(MINIAVMAINcontext);

    final response = await Dio().post(
      server + "MINIAV_SEND",
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

    Navigator.pop(MINIAVMAINcontext);
    MINIAVMAINcontext.read<MINIAVBloc_Bloc>().add(MINIAVBloc_Read());
    emit(output);
  }

  Future<void> _MINIAVMSG_Reject(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(MINIAVMAINcontext);

    final response = await Dio().post(
      server + "MINIAV_REJ",
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

    Navigator.pop(MINIAVMAINcontext);
    MINIAVMAINcontext.read<MINIAVBloc_Bloc>().add(MINIAVBloc_Read());
    emit(output);
  }

  Future<void> _MINIAVMSG_clear(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(MINIAVMAINcontext);

    final response = await Dio().post(
      server + "MINIAV_clear",
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

    Navigator.pop(MINIAVMAINcontext);
    MINIAVMAINcontext.read<MINIAVBloc_Bloc>().add(MINIAVBloc_Read());
    emit(output);
  }

  Future<void> _MINIAVMSG_Flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
