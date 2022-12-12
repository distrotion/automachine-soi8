import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/17-1-BOOKFEILD02Bloc.dart';
import '../bloc/BlocEvent/17-2-BOOKFEILD02MSG.dart';
import '17BOOKFEILD02/BOOKFEILD02MAIN.dart';

class Page17 extends StatelessWidget {
  const Page17({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page17BlocBody();
  }
}

class Page17BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page17BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BOOKFEILD02Bloc_Bloc(),
      child: BlocBuilder<BOOKFEILD02Bloc_Bloc, BOOKFEILD02Receive>(
        builder: (context, data) {
          return Page17BlocMSG(
            data: data,
          );
        },
      ),
    );
  }
}

class Page17BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page17BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  BOOKFEILD02Receive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BOOKFEILD02MSG_Bloc(),
      child: BlocBuilder<BOOKFEILD02MSG_Bloc, String>(
        builder: (context, msg) {
          return Page17Body(
            data: data,
            msg: msg,
          );
        },
      ),
    );
  }
}

class Page17Body extends StatelessWidget {
  Page17Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  BOOKFEILD02Receive? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return BOOKFEILD02MAIN(
      data: data,
      msg: msg,
    );
  }
}
