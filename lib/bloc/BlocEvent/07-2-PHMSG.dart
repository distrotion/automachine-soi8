import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/07PH/SCCMAIN.dart';
import '../../page/07PH/SCCVAR.dart';
import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';
import '07-1-PHBloc.dart';

//-------------------------------------------------
String server = serverG;

abstract class PHMSG_Event {}

class PHMSG_UserID extends PHMSG_Event {}

class PHMSG_Instrument extends PHMSG_Event {}

class PHMSG_Barcode extends PHMSG_Event {}

class PHMSG_Select_Send extends PHMSG_Event {}

class PHMSG_Reject extends PHMSG_Event {}

class PHMSG_clear extends PHMSG_Event {}

class PHMSG_Flush extends PHMSG_Event {}

class PHMSG_Bloc extends Bloc<PHMSG_Event, String> {
  PHMSG_Bloc() : super('') {
    on<PHMSG_UserID>((event, emit) {
      return _PHMSG_UserID('', emit);
    });

    on<PHMSG_Instrument>((event, emit) {
      return _PHMSG_Instrument('', emit);
    });

    on<PHMSG_Barcode>((event, emit) {
      return _PHMSG_Barcode('', emit);
    });

    on<PHMSG_Select_Send>((event, emit) {
      return _PHMSG_Select_Send('', emit);
    });

    on<PHMSG_Reject>((event, emit) {
      return _PHMSG_Reject('', emit);
    });

    on<PHMSG_clear>((event, emit) {
      return _PHMSG_clear('', emit);
    });

    on<PHMSG_Flush>((event, emit) {
      return _PHMSG_Flush('', emit);
    });
  }
  Future<void> _PHMSG_UserID(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PHMAINcontext);

    final response = await Dio().post(
      server + "setUserID_PH",
      data: {"UserID": PHVAR.UserID},
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

    Navigator.pop(PHMAINcontext);
    PHMAINcontext.read<PHBloc_Bloc>().add(PHBloc_Read());
    emit(output);
  }

  Future<void> _PHMSG_Instrument(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PHMAINcontext);

    final response = await Dio().post(
      server + "setInstrumentID_PH",
      data: {
        "InstrumentID": PHVAR.InstrumentID,
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

    Navigator.pop(PHMAINcontext);
    PHMAINcontext.read<PHBloc_Bloc>().add(PHBloc_Read());
    emit(output);
  }

  Future<void> _PHMSG_Barcode(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PHMAINcontext);

    final response = await Dio().post(
      server + "setBarcode_PH",
      data: {
        "Barcode": PHVAR.Barcode,
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

    Navigator.pop(PHMAINcontext);
    PHMAINcontext.read<PHBloc_Bloc>().add(PHBloc_Read());
    emit(output);
  }

  Future<void> _PHMSG_Select_W1(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PHMAINcontext);

    final response = await Dio().post(
      server + "PH_W1",
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

    Navigator.pop(PHMAINcontext);
    PHMAINcontext.read<PHBloc_Bloc>().add(PHBloc_Read());
    emit(output);
  }

  Future<void> _PHMSG_Select_Send(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PHMAINcontext);

    final response = await Dio().post(
      server + "PH_SEND",
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

    Navigator.pop(PHMAINcontext);
    PHMAINcontext.read<PHBloc_Bloc>().add(PHBloc_Read());
    emit(output);
  }

  Future<void> _PHMSG_Reject(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PHMAINcontext);

    final response = await Dio().post(
      server + "PH_REJ",
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

    Navigator.pop(PHMAINcontext);
    PHMAINcontext.read<PHBloc_Bloc>().add(PHBloc_Read());
    emit(output);
  }

  Future<void> _PHMSG_clear(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(PHMAINcontext);

    final response = await Dio().post(
      server + "PH_clear",
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

    Navigator.pop(PHMAINcontext);
    PHMAINcontext.read<PHBloc_Bloc>().add(PHBloc_Read());
    emit(output);
  }

  Future<void> _PHMSG_Flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
