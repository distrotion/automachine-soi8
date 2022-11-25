import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/08-1-SGBloc.dart';
import '../bloc/BlocEvent/08-2-SGMSG.dart';
import '08SG/SGMAIN.dart';

class Page8 extends StatelessWidget {
  const Page8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page8BlocBody();
  }
}

class Page8BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page8BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SGBloc_Bloc(),
      child: BlocBuilder<SGBloc_Bloc, SGReceive>(
        builder: (context, data) {
          return Page8BlocMSG(
            data: data,
          );
        },
      ),
    );
  }
}

class Page8BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page8BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  SGReceive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SGMSG_Bloc(),
      child: BlocBuilder<SGMSG_Bloc, String>(
        builder: (context, msg) {
          return Page8Body(
            data: data,
            msg: msg,
          );
        },
      ),
    );
  }
}

class Page8Body extends StatelessWidget {
  Page8Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  SGReceive? data;
  String? msg;
  @override
  Widget build(BuildContext context) {
    return SGMAIN(
      data: data,
      msg: msg,
    );
  }
}
