import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/06SCC/SCCMAIN.dart';
import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';
import '06-1-SCCBloc.dart';

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
    FreeLoading(SCCMAINcontext);

    final response = await Dio().post(
      server + "setUserID_FPSCC",
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

    Navigator.pop(SCCMAINcontext);
    SCCMAINcontext.read<SCCBloc_Bloc>().add(SCCBloc_Read());
    emit(output);
  }

  Future<void> _SCCMSG_Instrument(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(SCCMAINcontext);

    final response = await Dio().post(
      server + "setInstrumentID_FPSCC",
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

    Navigator.pop(SCCMAINcontext);
    SCCMAINcontext.read<SCCBloc_Bloc>().add(SCCBloc_Read());
    emit(output);
  }

  Future<void> _SCCMSG_Barcode(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(SCCMAINcontext);

    final response = await Dio().post(
      server + "setBarcode_FPSCC",
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

    Navigator.pop(SCCMAINcontext);
    SCCMAINcontext.read<SCCBloc_Bloc>().add(SCCBloc_Read());
    emit(output);
  }

  Future<void> _SCCMSG_Select_W1(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(SCCMAINcontext);

    final response = await Dio().post(
      server + "FPSCC_W1",
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

    Navigator.pop(SCCMAINcontext);
    SCCMAINcontext.read<SCCBloc_Bloc>().add(SCCBloc_Read());
    emit(output);
  }

  Future<void> _SCCMSG_Select_Send(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(SCCMAINcontext);

    final response = await Dio().post(
      server + "FPSCC_SEND",
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

    Navigator.pop(SCCMAINcontext);
    SCCMAINcontext.read<SCCBloc_Bloc>().add(SCCBloc_Read());
    emit(output);
  }

  Future<void> _SCCMSG_Reject(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(SCCMAINcontext);

    final response = await Dio().post(
      server + "FPSCC_REJ",
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

    Navigator.pop(SCCMAINcontext);
    SCCMAINcontext.read<SCCBloc_Bloc>().add(SCCBloc_Read());
    emit(output);
  }

  Future<void> _SCCMSG_clear(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(SCCMAINcontext);

    final response = await Dio().post(
      server + "FPSCC_clear",
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

    Navigator.pop(SCCMAINcontext);
    SCCMAINcontext.read<SCCBloc_Bloc>().add(SCCBloc_Read());
    emit(output);
  }

  Future<void> _SCCMSG_Flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
