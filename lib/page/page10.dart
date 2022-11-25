import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/10-1-KARLBloc.dart';
import '../bloc/BlocEvent/10-2-KARLMSG.dart';
import '10KARL/KARLMAIN.dart';

class Page10 extends StatelessWidget {
  const Page10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page10BlocBody();
  }
}

class Page10BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page10BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => KARLBloc_Bloc(),
      child: BlocBuilder<KARLBloc_Bloc, KARLReceive>(
        builder: (context, data) {
          return Page10BlocMSG(
            data: data,
          );
        },
      ),
    );
  }
}

class Page10BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page10BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  KARLReceive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => KARLMSG_Bloc(),
      child: BlocBuilder<KARLMSG_Bloc, String>(
        builder: (context, msg) {
          return Page10Body(
            data: data,
            msg: msg,
          );
        },
      ),
    );
  }
}

class Page10Body extends StatelessWidget {
  Page10Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  KARLReceive? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return KARLMAIN(
      data: data,
      msg: msg,
    );
  }
}
