import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/06-1-SCCBloc.dart';
import '../bloc/BlocEvent/06-2-SCCMSG.dart';
import '06SCC/SCCMAIN.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page6BlocBody();
  }
}

class Page6BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page6BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SCCBloc_Bloc(),
        child: BlocBuilder<SCCBloc_Bloc, SCCReceive>(
          builder: (context, data) {
            return Page6BlocMSG(
              data: data,
            );
          },
        ));
  }
}

class Page6BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page6BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  SCCReceive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SCCMSG_Bloc(),
        child: BlocBuilder<SCCMSG_Bloc, String>(
          builder: (context, msg) {
            return Page6Body(
              data: data,
              msg: msg,
            );
          },
        ));
  }
}

class Page6Body extends StatelessWidget {
  Page6Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  SCCReceive? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return SCCMAIN(
      data: data,
      msg: msg,
    );
  }
}
