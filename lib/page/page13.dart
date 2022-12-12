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
      create: (_) => PATICLESIZEBloc_Bloc(),
      child: BlocBuilder<PATICLESIZEBloc_Bloc, PATICLESIZEReceive>(
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
  PATICLESIZEReceive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PATICLESIZEMSG_Bloc(),
      child: BlocBuilder<PATICLESIZEMSG_Bloc, String>(
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
  PATICLESIZEReceive? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return PATICLESIZEMAIN();
  }
}
