import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/04-1-COCBloc.dart';
import '../bloc/BlocEvent/04-2-COCMSG.dart';
import '04COC/COCMAIN.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page4BlocBody();
  }
}

class Page4BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page4BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => COCBloc_Bloc(),
        child: BlocBuilder<COCBloc_Bloc, COCReceive>(
          builder: (context, data) {
            return Page4BlocMSG(
              data: data,
            );
          },
        ));
  }
}

class Page4BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page4BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  COCReceive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => COCMSG_Bloc(),
        child: BlocBuilder<COCMSG_Bloc, String>(
          builder: (context, msg) {
            return Page4Body(
              data: data,
              msg: msg,
            );
          },
        ));
  }
}

class Page4Body extends StatelessWidget {
  Page4Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  COCReceive? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return COCMAIN(
      data: data,
      msg: msg,
    );
  }
}
