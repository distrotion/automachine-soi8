import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/05-1-TCCBloc.dart';
import '../bloc/BlocEvent/05-2-TCCMSG.dart';
import '05TCC/TCCMAIN.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page5BlocBody();
  }
}

class Page5BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page5BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TCCBloc_Bloc(),
        child: BlocBuilder<TCCBloc_Bloc, TCCReceive>(
          builder: (context, data) {
            return Page5BlocMSG(
              data: data,
            );
          },
        ));
  }
}

class Page5BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page5BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  TCCReceive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TCCMSG_Bloc(),
        child: BlocBuilder<TCCMSG_Bloc, String>(
          builder: (context, msg) {
            return Page5Body(
              data: data,
              msg: msg,
            );
          },
        ));
  }
}

class Page5Body extends StatelessWidget {
  Page5Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  TCCReceive? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return TCCMAIN(
      data: data,
      msg: msg,
    );
  }
}
