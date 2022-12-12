import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/12AUTOTITRATE/AUTOTITRATEMAIN.dart';
import '../../page/12AUTOTITRATE/AUTOTITRATEVAR.dart';
import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';
import '12-1-AUTOTITRATEBloc.dart';

//-------------------------------------------------
String server = serverG;

abstract class AUTOTITRATEMSG_Event {}

class AUTOTITRATEMSG_UserID extends AUTOTITRATEMSG_Event {}

class AUTOTITRATEMSG_Instrument extends AUTOTITRATEMSG_Event {}

class AUTOTITRATEMSG_Barcode extends AUTOTITRATEMSG_Event {}

class AUTOTITRATEMSG_Select_Send extends AUTOTITRATEMSG_Event {}

class AUTOTITRATEMSG_Reject extends AUTOTITRATEMSG_Event {}

class AUTOTITRATEMSG_clear extends AUTOTITRATEMSG_Event {}

class AUTOTITRATEMSG_Flush extends AUTOTITRATEMSG_Event {}

class AUTOTITRATEMSG_Bloc extends Bloc<AUTOTITRATEMSG_Event, String> {
  AUTOTITRATEMSG_Bloc() : super('') {
    on<AUTOTITRATEMSG_UserID>((event, emit) {
      return _AUTOTITRATEMSG_UserID('', emit);
    });

    on<AUTOTITRATEMSG_Instrument>((event, emit) {
      return _AUTOTITRATEMSG_Instrument('', emit);
    });

    on<AUTOTITRATEMSG_Barcode>((event, emit) {
      return _AUTOTITRATEMSG_Barcode('', emit);
    });

    on<AUTOTITRATEMSG_Select_Send>((event, emit) {
      return _AUTOTITRATEMSG_Select_Send('', emit);
    });

    on<AUTOTITRATEMSG_Reject>((event, emit) {
      return _AUTOTITRATEMSG_Reject('', emit);
    });

    on<AUTOTITRATEMSG_clear>((event, emit) {
      return _AUTOTITRATEMSG_clear('', emit);
    });

    on<AUTOTITRATEMSG_Flush>((event, emit) {
      return _AUTOTITRATEMSG_Flush('', emit);
    });
  }
  Future<void> _AUTOTITRATEMSG_UserID(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(AUTOTITRATEMAINcontext);

    final response = await Dio().post(
      server + "setUserID_AUTOTITRATE",
      data: {"UserID": AUTOTITRATEVAR.UserID},
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

    Navigator.pop(AUTOTITRATEMAINcontext);
    AUTOTITRATEMAINcontext.read<AUTOTITRATEBloc_Bloc>()
        .add(AUTOTITRATEBloc_Read());
    emit(output);
  }

  Future<void> _AUTOTITRATEMSG_Instrument(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(AUTOTITRATEMAINcontext);

    final response = await Dio().post(
      server + "setInstrumentID_AUTOTITRATE",
      data: {
        "InstrumentID": AUTOTITRATEVAR.InstrumentID,
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      if (databuff != null) {
        if (databuff.toString() == 'OK') {
          ////
          output = 'OK';
        } else {
          output = 'NOK';
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "Error", "WRONG MATCHINE", enumNotificationlist.Error);
        }
      }
    }

    Navigator.pop(AUTOTITRATEMAINcontext);
    AUTOTITRATEMAINcontext.read<AUTOTITRATEBloc_Bloc>()
        .add(AUTOTITRATEBloc_Read());
    emit(output);
  }

  Future<void> _AUTOTITRATEMSG_Barcode(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(AUTOTITRATEMAINcontext);

    final response = await Dio().post(
      server + "setBarcode_AUTOTITRATE",
      data: {
        "Barcode": AUTOTITRATEVAR.Barcode,
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

    Navigator.pop(AUTOTITRATEMAINcontext);
    AUTOTITRATEMAINcontext.read<AUTOTITRATEBloc_Bloc>()
        .add(AUTOTITRATEBloc_Read());
    emit(output);
  }

  Future<void> _AUTOTITRATEMSG_Select_W1(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(AUTOTITRATEMAINcontext);

    final response = await Dio().post(
      server + "AUTOTITRATE_W1",
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

    Navigator.pop(AUTOTITRATEMAINcontext);
    AUTOTITRATEMAINcontext.read<AUTOTITRATEBloc_Bloc>()
        .add(AUTOTITRATEBloc_Read());
    emit(output);
  }

  Future<void> _AUTOTITRATEMSG_Select_Send(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(AUTOTITRATEMAINcontext);

    final response = await Dio().post(
      server + "AUTOTITRATE_SEND",
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

    Navigator.pop(AUTOTITRATEMAINcontext);
    AUTOTITRATEMAINcontext.read<AUTOTITRATEBloc_Bloc>()
        .add(AUTOTITRATEBloc_Read());
    emit(output);
  }

  Future<void> _AUTOTITRATEMSG_Reject(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(AUTOTITRATEMAINcontext);

    final response = await Dio().post(
      server + "AUTOTITRATE_REJ",
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

    Navigator.pop(AUTOTITRATEMAINcontext);
    AUTOTITRATEMAINcontext.read<AUTOTITRATEBloc_Bloc>()
        .add(AUTOTITRATEBloc_Read());
    emit(output);
  }

  Future<void> _AUTOTITRATEMSG_clear(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(AUTOTITRATEMAINcontext);

    final response = await Dio().post(
      server + "AUTOTITRATE_clear",
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

    Navigator.pop(AUTOTITRATEMAINcontext);
    AUTOTITRATEMAINcontext.read<AUTOTITRATEBloc_Bloc>()
        .add(AUTOTITRATEBloc_Read());
    emit(output);
  }

  Future<void> _AUTOTITRATEMSG_Flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
