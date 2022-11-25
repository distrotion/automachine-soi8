import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/11BALANCEa/BALANCEaMAIN.dart';
import '../../page/11BALANCEa/BALANCEaVAR.dart';
import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';
import '11-1-BALANCEaBloc.dart';

//-------------------------------------------------
String server = serverG;

abstract class BALANCEaMSG_Event {}

class BALANCEaMSG_UserID extends BALANCEaMSG_Event {}

class BALANCEaMSG_Instrument extends BALANCEaMSG_Event {}

class BALANCEaMSG_Barcode extends BALANCEaMSG_Event {}

class BALANCEaMSG_Select_Send extends BALANCEaMSG_Event {}

class BALANCEaMSG_Reject extends BALANCEaMSG_Event {}

class BALANCEaMSG_clear extends BALANCEaMSG_Event {}

class BALANCEaMSG_Flush extends BALANCEaMSG_Event {}

class BALANCEaMSG_Bloc extends Bloc<BALANCEaMSG_Event, String> {
  BALANCEaMSG_Bloc() : super('') {
    on<BALANCEaMSG_UserID>((event, emit) {
      return _BALANCEaMSG_UserID('', emit);
    });

    on<BALANCEaMSG_Instrument>((event, emit) {
      return _BALANCEaMSG_Instrument('', emit);
    });

    on<BALANCEaMSG_Barcode>((event, emit) {
      return _BALANCEaMSG_Barcode('', emit);
    });

    on<BALANCEaMSG_Select_Send>((event, emit) {
      return _BALANCEaMSG_Select_Send('', emit);
    });

    on<BALANCEaMSG_Reject>((event, emit) {
      return _BALANCEaMSG_Reject('', emit);
    });

    on<BALANCEaMSG_clear>((event, emit) {
      return _BALANCEaMSG_clear('', emit);
    });

    on<BALANCEaMSG_Flush>((event, emit) {
      return _BALANCEaMSG_Flush('', emit);
    });
  }
  Future<void> _BALANCEaMSG_UserID(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BALANCEaMAINcontext);

    final response = await Dio().post(
      server + "setUserID_BALANCEa",
      data: {"UserID": BALANCEaVAR.UserID},
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

    Navigator.pop(BALANCEaMAINcontext);
    BALANCEaMAINcontext.read<BALANCEaBloc_Bloc>().add(BALANCEaBloc_Read());
    emit(output);
  }

  Future<void> _BALANCEaMSG_Instrument(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BALANCEaMAINcontext);

    final response = await Dio().post(
      server + "setInstrumentID_BALANCEa",
      data: {
        "InstrumentID": BALANCEaVAR.InstrumentID,
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

    Navigator.pop(BALANCEaMAINcontext);
    BALANCEaMAINcontext.read<BALANCEaBloc_Bloc>().add(BALANCEaBloc_Read());
    emit(output);
  }

  Future<void> _BALANCEaMSG_Barcode(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BALANCEaMAINcontext);

    final response = await Dio().post(
      server + "setBarcode_BALANCEa",
      data: {
        "Barcode": BALANCEaVAR.Barcode,
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

    Navigator.pop(BALANCEaMAINcontext);
    BALANCEaMAINcontext.read<BALANCEaBloc_Bloc>().add(BALANCEaBloc_Read());
    emit(output);
  }

  Future<void> _BALANCEaMSG_Select_W1(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BALANCEaMAINcontext);

    final response = await Dio().post(
      server + "BALANCEa_W1",
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

    Navigator.pop(BALANCEaMAINcontext);
    BALANCEaMAINcontext.read<BALANCEaBloc_Bloc>().add(BALANCEaBloc_Read());
    emit(output);
  }

  Future<void> _BALANCEaMSG_Select_Send(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BALANCEaMAINcontext);

    final response = await Dio().post(
      server + "BALANCEa_SEND",
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

    Navigator.pop(BALANCEaMAINcontext);
    BALANCEaMAINcontext.read<BALANCEaBloc_Bloc>().add(BALANCEaBloc_Read());
    emit(output);
  }

  Future<void> _BALANCEaMSG_Reject(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BALANCEaMAINcontext);

    final response = await Dio().post(
      server + "BALANCEa_REJ",
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

    Navigator.pop(BALANCEaMAINcontext);
    BALANCEaMAINcontext.read<BALANCEaBloc_Bloc>().add(BALANCEaBloc_Read());
    emit(output);
  }

  Future<void> _BALANCEaMSG_clear(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(BALANCEaMAINcontext);

    final response = await Dio().post(
      server + "BALANCEa_clear",
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

    Navigator.pop(BALANCEaMAINcontext);
    BALANCEaMAINcontext.read<BALANCEaBloc_Bloc>().add(BALANCEaBloc_Read());
    emit(output);
  }

  Future<void> _BALANCEaMSG_Flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
