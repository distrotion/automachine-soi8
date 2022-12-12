import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/13-1-PARTICALSIZEBloc.dart';

import '../bloc/BlocEvent/13-2-PARTICALSIZEMSG.dart';
import '13PARTICALSIZE/PARTICALSIZEMAIN.dart';

class Page13 extends StatelessWidget {
  const Page13({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page13BlocBody();
  }
}

class Page13BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page13BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PARTICLESIZEBloc_Bloc(),
      child: BlocBuilder<PARTICLESIZEBloc_Bloc, PARTICLESIZEReceive>(
        builder: (context, data) {
          return Page13BlocMSG(
            data: data,
          );
        },
      ),
    );
  }
}

class Page13BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page13BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  PARTICLESIZEReceive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PARTICLESIZEMSG_Bloc(),
      child: BlocBuilder<PARTICLESIZEMSG_Bloc, String>(
        builder: (context, msg) {
          return Page13Body(
            data: data,
            msg: msg,
          );
        },
      ),
    );
  }
}

class Page13Body extends StatelessWidget {
  Page13Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  PARTICLESIZEReceive? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return PARTICLESIZEMAIN(
      data: data,
      msg: msg,
    );
  }
}
