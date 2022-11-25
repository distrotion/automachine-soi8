import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/09DENSITY/DENSITYMAIN.dart';
import '../../page/09DENSITY/DENSITYVAR.dart';
import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';
import '09-1-DENSITYBloc.dart';

//-------------------------------------------------
String server = serverG;

abstract class DENSITYMSG_Event {}

class DENSITYMSG_UserID extends DENSITYMSG_Event {}

class DENSITYMSG_Instrument extends DENSITYMSG_Event {}

class DENSITYMSG_Barcode extends DENSITYMSG_Event {}

class DENSITYMSG_Select_Send extends DENSITYMSG_Event {}

class DENSITYMSG_Reject extends DENSITYMSG_Event {}

class DENSITYMSG_clear extends DENSITYMSG_Event {}

class DENSITYMSG_Flush extends DENSITYMSG_Event {}

class DENSITYMSG_Bloc extends Bloc<DENSITYMSG_Event, String> {
  DENSITYMSG_Bloc() : super('') {
    on<DENSITYMSG_UserID>((event, emit) {
      return _DENSITYMSG_UserID('', emit);
    });

    on<DENSITYMSG_Instrument>((event, emit) {
      return _DENSITYMSG_Instrument('', emit);
    });

    on<DENSITYMSG_Barcode>((event, emit) {
      return _DENSITYMSG_Barcode('', emit);
    });

    on<DENSITYMSG_Select_Send>((event, emit) {
      return _DENSITYMSG_Select_Send('', emit);
    });

    on<DENSITYMSG_Reject>((event, emit) {
      return _DENSITYMSG_Reject('', emit);
    });

    on<DENSITYMSG_clear>((event, emit) {
      return _DENSITYMSG_clear('', emit);
    });

    on<DENSITYMSG_Flush>((event, emit) {
      return _DENSITYMSG_Flush('', emit);
    });
  }
  Future<void> _DENSITYMSG_UserID(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(DENSITYMAINcontext);

    final response = await Dio().post(
      server + "setUserID_DENSITY",
      data: {"UserID": DENSITYVAR.UserID},
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

    Navigator.pop(DENSITYMAINcontext);
    DENSITYMAINcontext.read<DENSITYBloc_Bloc>().add(DENSITYBloc_Read());
    emit(output);
  }

  Future<void> _DENSITYMSG_Instrument(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(DENSITYMAINcontext);

    final response = await Dio().post(
      server + "setInstrumentID_DENSITY",
      data: {
        "InstrumentID": DENSITYVAR.InstrumentID,
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

    Navigator.pop(DENSITYMAINcontext);
    DENSITYMAINcontext.read<DENSITYBloc_Bloc>().add(DENSITYBloc_Read());
    emit(output);
  }

  Future<void> _DENSITYMSG_Barcode(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(DENSITYMAINcontext);

    final response = await Dio().post(
      server + "setBarcode_DENSITY",
      data: {
        "Barcode": DENSITYVAR.Barcode,
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

    Navigator.pop(DENSITYMAINcontext);
    DENSITYMAINcontext.read<DENSITYBloc_Bloc>().add(DENSITYBloc_Read());
    emit(output);
  }

  Future<void> _DENSITYMSG_Select_W1(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(DENSITYMAINcontext);

    final response = await Dio().post(
      server + "DENSITY_W1",
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

    Navigator.pop(DENSITYMAINcontext);
    DENSITYMAINcontext.read<DENSITYBloc_Bloc>().add(DENSITYBloc_Read());
    emit(output);
  }

  Future<void> _DENSITYMSG_Select_Send(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(DENSITYMAINcontext);

    final response = await Dio().post(
      server + "DENSITY_SEND",
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

    Navigator.pop(DENSITYMAINcontext);
    DENSITYMAINcontext.read<DENSITYBloc_Bloc>().add(DENSITYBloc_Read());
    emit(output);
  }

  Future<void> _DENSITYMSG_Reject(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(DENSITYMAINcontext);

    final response = await Dio().post(
      server + "DENSITY_REJ",
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

    Navigator.pop(DENSITYMAINcontext);
    DENSITYMAINcontext.read<DENSITYBloc_Bloc>().add(DENSITYBloc_Read());
    emit(output);
  }

  Future<void> _DENSITYMSG_clear(String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(DENSITYMAINcontext);

    final response = await Dio().post(
      server + "DENSITY_clear",
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

    Navigator.pop(DENSITYMAINcontext);
    DENSITYMAINcontext.read<DENSITYBloc_Bloc>().add(DENSITYBloc_Read());
    emit(output);
  }

  Future<void> _DENSITYMSG_Flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
