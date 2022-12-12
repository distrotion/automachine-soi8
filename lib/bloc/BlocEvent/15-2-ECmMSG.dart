import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/15ECm/ECmMAIN.dart';
import '../../page/15ECm/ECmVAR.dart';
import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';
import '15-1-ECmBloc.dart';

//-------------------------------------------------
String server = serverG;

abstract class ECmMSG_Event {}

class ECmMSG_UserID extends ECmMSG_Event {}

class ECmMSG_Instrument extends ECmMSG_Event {}

class ECmMSG_Barcode extends ECmMSG_Event {}

class ECmMSG_Select_Send extends ECmMSG_Event {}

class ECmMSG_Reject extends ECmMSG_Event {}

class ECmMSG_clear extends ECmMSG_Event {}

class ECmMSG_Flush extends ECmMSG_Event {}

class ECmMSG_Bloc extends Bloc<ECmMSG_Event, String> {
  ECmMSG_Bloc() : super('') {
    on<ECmMSG_UserID>((event, emit) {
      return _ECmMSG_UserID('', emit);
    });

    on<ECmMSG_Instrument>((event, emit) {
      return _ECmMSG_Instrument('', emit);
    });

    on<ECmMSG_Barcode>((event, emit) {
      return _ECmMSG_Barcode('', emit);
    });

    on<ECmMSG_Select_Send>((event, emit) {
      return _ECmMSG_Select_Send('', emit);
    });

    on<ECmMSG_Reject>((event, emit) {
      return _ECmMSG_Reject('', emit);
    });

    on<ECmMSG_clear>((event, emit) {
      return _ECmMSG_clear('', emit);
    });

    on<ECmMSG_Flush>((event, emit) {
      return _ECmMSG_Flush('', emit);
    });
  }
  Future<void> _ECmMSG_UserID(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(ECmMAINcontext);

    final response = await Dio().post(
      server + "setUserID_ECm",
      data: {"UserID": ECmVAR.UserID},
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

    Navigator.pop(ECmMAINcontext);
    ECmMAINcontext.read<ECmBloc_Bloc>().add(ECmBloc_Read());
    emit(output);
  }

  Future<void> _ECmMSG_Instrument(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(ECmMAINcontext);

    final response = await Dio().post(
      server + "setInstrumentID_ECm",
      data: {
        "InstrumentID": ECmVAR.InstrumentID,
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

    Navigator.pop(ECmMAINcontext);
    ECmMAINcontext.read<ECmBloc_Bloc>().add(ECmBloc_Read());
    emit(output);
  }

  Future<void> _ECmMSG_Barcode(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(ECmMAINcontext);

    final response = await Dio().post(
      server + "setBarcode_ECm",
      data: {
        "Barcode": ECmVAR.Barcode,
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

    Navigator.pop(ECmMAINcontext);
    ECmMAINcontext.read<ECmBloc_Bloc>().add(ECmBloc_Read());
    emit(output);
  }

  Future<void> _ECmMSG_Select_W1(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(ECmMAINcontext);

    final response = await Dio().post(
      server + "ECm_W1",
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

    Navigator.pop(ECmMAINcontext);
    ECmMAINcontext.read<ECmBloc_Bloc>().add(ECmBloc_Read());
    emit(output);
  }

  Future<void> _ECmMSG_Select_Send(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(ECmMAINcontext);

    final response = await Dio().post(
      server + "ECm_SEND",
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

    Navigator.pop(ECmMAINcontext);
    ECmMAINcontext.read<ECmBloc_Bloc>().add(ECmBloc_Read());
    emit(output);
  }

  Future<void> _ECmMSG_Reject(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(ECmMAINcontext);

    final response = await Dio().post(
      server + "ECm_REJ",
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

    Navigator.pop(ECmMAINcontext);
    ECmMAINcontext.read<ECmBloc_Bloc>().add(ECmBloc_Read());
    emit(output);
  }

  Future<void> _ECmMSG_clear(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(ECmMAINcontext);

    final response = await Dio().post(
      server + "ECm_clear",
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

    Navigator.pop(ECmMAINcontext);
    ECmMAINcontext.read<ECmBloc_Bloc>().add(ECmBloc_Read());
    emit(output);
  }

  Future<void> _ECmMSG_Flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
