import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/07-1-PHBloc.dart';
import '../bloc/BlocEvent/07-2-PHMSG.dart';
import '07PH/SCCMAIN.dart';

class Page7 extends StatelessWidget {
  const Page7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page7BlocBody();
  }
}

class Page7BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page7BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PHBloc_Bloc(),
        child: BlocBuilder<PHBloc_Bloc, PHReceive>(
          builder: (context, data) {
            return Page7BlocMSG(
              data: data,
            );
          },
        ));
  }
}

class Page7BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page7BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  PHReceive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PHMSG_Bloc(),
        child: BlocBuilder<PHMSG_Bloc, String>(
          builder: (context, msg) {
            return Page7Body(
              data: data,
              msg: msg,
            );
          },
        ));
  }
}

class Page7Body extends StatelessWidget {
  Page7Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  PHReceive? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return PHMAIN(
      data: data,
      msg: msg,
    );
  }
}
