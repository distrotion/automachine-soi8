import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/18PENETROMETER/PENETROMETERMAIN.dart';
import '../../page/18PENETROMETER/PENETROMETERVAR.dart';
import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';
import '18-1-PENETROMETERBloc.dart';

//-------------------------------------------------
String server = serverG;

abstract class PENETROMETERMSG_Event {}

class PENETROMETERMSG_UserID extends PENETROMETERMSG_Event {}

class PENETROMETERMSG_Instrument extends PENETROMETERMSG_Event {}

class PENETROMETERMSG_Barcode extends PENETROMETERMSG_Event {}

class PENETROMETERMSG_Select_Send extends PENETROMETERMSG_Event {}

class PENETROMETERMSG_Reject extends PENETROMETERMSG_Event {}

class PENETROMETERMSG_clear extends PENETROMETERMSG_Event {}

class PENETROMETERMSG_Flush extends PENETROMETERMSG_Event {}

class PENETROMETERMSG_Bloc extends Bloc<PENETROMETERMSG_Event, String> {
  PENETROMETERMSG_Bloc() : super('') {
    on<PENETROMETERMSG_UserID>((event, emit) {
      return _PENETROMETERMSG_UserID('', emit);
    });

    on<PENETROMETERMSG_Instrument>((event, emit) {
      return _PENETROMETERMSG_Instrument('', emit);
    });

    on<PENETROMETERMSG_Barcode>((event, emit) {
      return _PENETROMETERMSG_Barcode('', emit);
    });

    on<PENETROMETERMSG_Select_Send>((event, emit) {
      return _PENETROMETERMSG_Select_Send('', emit);
    });

    on<PENETROMETERMSG_Reject>((event, emit) {
      return _PENETROMETERMSG_Reject('', emit);
    });

    on<PENETROMETERMSG_clear>((event, emit) {
      return _PENETROMETERMSG_clear('', emit);
    });

    on<PENETROMETERMSG_Flush>((event, emit) {
      return _PENETROMETERMSG_Flush('', emit);
    });
  }
  Future<void> _PENETROMETERMSG_UserID(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PENETROMETERMAINcontext);

    final response = await Dio().post(
      server + "setUserID_PENETROMETER",
      data: {"UserID": PENETROMETERVAR.UserID},
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

    Navigator.pop(PENETROMETERMAINcontext);
    PENETROMETERMAINcontext.read<PENETROMETERBloc_Bloc>()
        .add(PENETROMETERBloc_Read());
    emit(output);
  }

  Future<void> _PENETROMETERMSG_Instrument(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PENETROMETERMAINcontext);

    final response = await Dio().post(
      server + "setInstrumentID_PENETROMETER",
      data: {
        "InstrumentID": PENETROMETERVAR.InstrumentID,
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

    Navigator.pop(PENETROMETERMAINcontext);
    PENETROMETERMAINcontext.read<PENETROMETERBloc_Bloc>()
        .add(PENETROMETERBloc_Read());
    emit(output);
  }

  Future<void> _PENETROMETERMSG_Barcode(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PENETROMETERMAINcontext);

    final response = await Dio().post(
      server + "setBarcode_PENETROMETER",
      data: {
        "Barcode": PENETROMETERVAR.Barcode,
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

    Navigator.pop(PENETROMETERMAINcontext);
    PENETROMETERMAINcontext.read<PENETROMETERBloc_Bloc>()
        .add(PENETROMETERBloc_Read());
    emit(output);
  }

  Future<void> _PENETROMETERMSG_Select_W1(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PENETROMETERMAINcontext);

    final response = await Dio().post(
      server + "PENETROMETER_W1",
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

    Navigator.pop(PENETROMETERMAINcontext);
    PENETROMETERMAINcontext.read<PENETROMETERBloc_Bloc>()
        .add(PENETROMETERBloc_Read());
    emit(output);
  }

  Future<void> _PENETROMETERMSG_Select_Send(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PENETROMETERMAINcontext);

    final response = await Dio().post(
      server + "PENETROMETER_SEND",
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

    Navigator.pop(PENETROMETERMAINcontext);
    PENETROMETERMAINcontext.read<PENETROMETERBloc_Bloc>()
        .add(PENETROMETERBloc_Read());
    emit(output);
  }

  Future<void> _PENETROMETERMSG_Reject(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PENETROMETERMAINcontext);

    final response = await Dio().post(
      server + "PENETROMETER_REJ",
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

    Navigator.pop(PENETROMETERMAINcontext);
    PENETROMETERMAINcontext.read<PENETROMETERBloc_Bloc>()
        .add(PENETROMETERBloc_Read());
    emit(output);
  }

  Future<void> _PENETROMETERMSG_clear(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PENETROMETERMAINcontext);

    final response = await Dio().post(
      server + "PENETROMETER_clear",
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

    Navigator.pop(PENETROMETERMAINcontext);
    PENETROMETERMAINcontext.read<PENETROMETERBloc_Bloc>()
        .add(PENETROMETERBloc_Read());
    emit(output);
  }

  Future<void> _PENETROMETERMSG_Flush(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
