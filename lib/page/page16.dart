import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/16-1-BOOKFEILD01Bloc.dart';
import '../bloc/BlocEvent/16-2-BOOKFEILD01MSG.dart';
import '16BOOKFEILD01/BOOKFEILD01MAIN.dart';

class Page16 extends StatelessWidget {
  const Page16({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page16BlocBody();
  }
}

class Page16BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page16BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BOOKFEILD01Bloc_Bloc(),
      child: BlocBuilder<BOOKFEILD01Bloc_Bloc, BOOKFEILD01Receive>(
        builder: (context, data) {
          return Page16BlocMSG(
            data: data,
          );
        },
      ),
    );
  }
}

class Page16BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page16BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  BOOKFEILD01Receive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BOOKFEILD01MSG_Bloc(),
      child: BlocBuilder<BOOKFEILD01MSG_Bloc, String>(
        builder: (context, msg) {
          return Page16Body(
            data: data,
            msg: msg,
          );
        },
      ),
    );
  }
}

class Page16Body extends StatelessWidget {
  Page16Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  BOOKFEILD01Receive? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return BOOKFEILD01MAIN(
      data: data,
      msg: msg,
    );
  }
}
