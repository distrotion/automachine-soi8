import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/02WeightBalance01/WeightBalance01MAIN.dart';
import '../../page/02WeightBalance01/WeightBalance01VAR.dart';
import '../../widget/common/Loading.dart';
import '../cubit/NotificationEvent.dart';
import '03-1-WeighBalance02Bloc.dart';

//-------------------------------------------------
String server = serverG;

abstract class WeighBalance02MSG_Event {}

class WeighBalance02MSG_UserID extends WeighBalance02MSG_Event {}

class WeighBalance02MSG_Instrument extends WeighBalance02MSG_Event {}

class WeighBalance02MSG_Barcode extends WeighBalance02MSG_Event {}

class WeighBalance02MSG_Select_W1 extends WeighBalance02MSG_Event {}

class WeighBalance02MSG_Back_W1 extends WeighBalance02MSG_Event {}

class WeighBalance02MSG_Select_W2 extends WeighBalance02MSG_Event {}

class WeighBalance02MSG_Back_W2 extends WeighBalance02MSG_Event {}

class WeighBalance02MSG_Select_W3 extends WeighBalance02MSG_Event {}

class WeighBalance02MSG_Back_W3 extends WeighBalance02MSG_Event {}

class WeighBalance02MSG_Recal extends WeighBalance02MSG_Event {}

class WeighBalance02MSG_Select_Send extends WeighBalance02MSG_Event {}

class WeighBalance02MSG_Reject extends WeighBalance02MSG_Event {}

class WeighBalance02MSG_clear extends WeighBalance02MSG_Event {}

class WeighBalance02MSG_Flush extends WeighBalance02MSG_Event {}

class WeighBalance02MSG_Bloc extends Bloc<WeighBalance02MSG_Event, String> {
  WeighBalance02MSG_Bloc() : super('') {
    on<WeighBalance02MSG_UserID>((event, emit) {
      return _WeighBalance02MSG_UserID('', emit);
    });

    on<WeighBalance02MSG_Instrument>((event, emit) {
      return _WeighBalance02MSG_Instrument('', emit);
    });
    on<WeighBalance02MSG_Barcode>((event, emit) {
      return _WeighBalance02MSG_Barcode('', emit);
    });
    on<WeighBalance02MSG_Select_W1>((event, emit) {
      return _WeighBalance02MSG_Select_W1('', emit);
    });
    on<WeighBalance02MSG_Back_W1>((event, emit) {
      return _WeighBalance02MSG_Back_W1('', emit);
    });
    on<WeighBalance02MSG_Select_W2>((event, emit) {
      return _WeighBalance02MSG_Select_W2('', emit);
    });
    on<WeighBalance02MSG_Back_W2>((event, emit) {
      return _WeighBalance02MSG_Back_W2('', emit);
    });
    on<WeighBalance02MSG_Select_W3>((event, emit) {
      return _WeighBalance02MSG_Select_W3('', emit);
    });
    on<WeighBalance02MSG_Back_W3>((event, emit) {
      return _WeighBalance02MSG_Back_W3('', emit);
    });

    on<WeighBalance02MSG_Recal>((event, emit) {
      return _WeighBalance02MSG_Recal('', emit);
    });

    on<WeighBalance02MSG_Select_Send>((event, emit) {
      return _WeighBalance02MSG_Select_Send('', emit);
    });

    on<WeighBalance02MSG_Reject>((event, emit) {
      return _WeighBalance02MSG_Reject('', emit);
    });

    on<WeighBalance02MSG_clear>((event, emit) {
      return _WeighBalance02MSG_clear('', emit);
    });

    on<WeighBalance02MSG_Flush>((event, emit) {
      return _WeighBalance02MSG_Flush('', emit);
    });
  }
  Future<void> _WeighBalance02MSG_UserID(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(WeightBalanceMAINcontext);
    final response = await Dio().post(
      server + "setUserID_WBA01",
      data: {
        "UserID": WeightBalance01VAR.UserID,
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
        }
      }
    }
    //
    Navigator.pop(WeightBalanceMAINcontext);
    WeightBalanceMAINcontext.read<WeighBalance02Bloc_Bloc>()
        .add(WeighBalance02Bloc_Read());
    emit(output);
  }

  Future<void> _WeighBalance02MSG_Instrument(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(WeightBalanceMAINcontext);
    final response = await Dio().post(
      server + "setInstrumentID_WBA01",
      data: {
        "InstrumentID": WeightBalance01VAR.InstrumentID,
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
    Navigator.pop(WeightBalanceMAINcontext);
    WeightBalanceMAINcontext.read<WeighBalance02Bloc_Bloc>()
        .add(WeighBalance02Bloc_Read());
    emit(output);
  }

  Future<void> _WeighBalance02MSG_Barcode(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(WeightBalanceMAINcontext);
    final response = await Dio().post(
      server + "setBarcode_WBA01",
      data: {
        "Barcode": WeightBalance01VAR.Barcode,
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
    Navigator.pop(WeightBalanceMAINcontext);
    WeightBalanceMAINcontext.read<WeighBalance02Bloc_Bloc>()
        .add(WeighBalance02Bloc_Read());
    emit(output);
  }

  Future<void> _WeighBalance02MSG_Select_W1(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(WeightBalanceMAINcontext);
    final response = await Dio().post(
      server + "WBA01_W1",
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
    Navigator.pop(WeightBalanceMAINcontext);
    WeightBalanceMAINcontext.read<WeighBalance02Bloc_Bloc>()
        .add(WeighBalance02Bloc_Read());
    emit(output);
  }

  Future<void> _WeighBalance02MSG_Back_W1(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(WeightBalanceMAINcontext);
    final response = await Dio().post(
      server + "WBA01_W1_BACK",
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
    Navigator.pop(WeightBalanceMAINcontext);
    WeightBalanceMAINcontext.read<WeighBalance02Bloc_Bloc>()
        .add(WeighBalance02Bloc_Read());
    emit(output);
  }

  Future<void> _WeighBalance02MSG_Select_W2(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(WeightBalanceMAINcontext);
    final response = await Dio().post(
      server + "WBA01_W2",
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
    Navigator.pop(WeightBalanceMAINcontext);
    WeightBalanceMAINcontext.read<WeighBalance02Bloc_Bloc>()
        .add(WeighBalance02Bloc_Read());
    emit(output);
  }

  Future<void> _WeighBalance02MSG_Back_W2(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(WeightBalanceMAINcontext);
    final response = await Dio().post(
      server + "WBA01_W2_BACK",
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
    Navigator.pop(WeightBalanceMAINcontext);
    WeightBalanceMAINcontext.read<WeighBalance02Bloc_Bloc>()
        .add(WeighBalance02Bloc_Read());
    emit(output);
  }

  Future<void> _WeighBalance02MSG_Select_W3(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(WeightBalanceMAINcontext);
    final response = await Dio().post(
      server + "WBA01_W3",
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
    Navigator.pop(WeightBalanceMAINcontext);
    WeightBalanceMAINcontext.read<WeighBalance02Bloc_Bloc>()
        .add(WeighBalance02Bloc_Read());
    emit(output);
  }

  Future<void> _WeighBalance02MSG_Back_W3(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(WeightBalanceMAINcontext);
    final response = await Dio().post(
      server + "WBA01_W3_BACK",
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
    Navigator.pop(WeightBalanceMAINcontext);
    WeightBalanceMAINcontext.read<WeighBalance02Bloc_Bloc>()
        .add(WeighBalance02Bloc_Read());
    emit(output);
  }

  Future<void> _WeighBalance02MSG_Recal(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(WeightBalanceMAINcontext);
    final response = await Dio().post(
      server + "WBA01_Recal",
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
    Navigator.pop(WeightBalanceMAINcontext);
    WeightBalanceMAINcontext.read<WeighBalance02Bloc_Bloc>()
        .add(WeighBalance02Bloc_Read());
    emit(output);
  }

  Future<void> _WeighBalance02MSG_Select_Send(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(WeightBalanceMAINcontext);
    final response = await Dio().post(
      server + "WBA01_SEND",
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
    Navigator.pop(WeightBalanceMAINcontext);
    WeightBalanceMAINcontext.read<WeighBalance02Bloc_Bloc>()
        .add(WeighBalance02Bloc_Read());
    emit(output);
  }

  Future<void> _WeighBalance02MSG_Reject(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(WeightBalanceMAINcontext);
    final response = await Dio().post(
      server + "WBA01_REJ",
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
    Navigator.pop(WeightBalanceMAINcontext);
    WeightBalanceMAINcontext.read<WeighBalance02Bloc_Bloc>()
        .add(WeighBalance02Bloc_Read());
    emit(output);
  }

  Future<void> _WeighBalance02MSG_clear(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    FreeLoading(WeightBalanceMAINcontext);
    final response = await Dio().post(
      server + "WBA01_clear",
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
    Navigator.pop(WeightBalanceMAINcontext);
    WeightBalanceMAINcontext.read<WeighBalance02Bloc_Bloc>()
        .add(WeighBalance02Bloc_Read());
    emit(output);
  }

  Future<void> _WeighBalance02MSG_Flush(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
