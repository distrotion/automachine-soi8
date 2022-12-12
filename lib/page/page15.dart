import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/15-1-ECmBloc.dart';
import '../bloc/BlocEvent/15-2-ECmMSG.dart';
import '15ECm/ECmMAIN.dart';

class Page15 extends StatelessWidget {
  const Page15({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page15BlocBody();
  }
}

class Page15BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page15BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ECmBloc_Bloc(),
      child: BlocBuilder<ECmBloc_Bloc, ECmReceive>(
        builder: (context, data) {
          return Page15BlocMSG(
            data: data,
          );
        },
      ),
    );
  }
}

class Page15BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page15BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  ECmReceive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ECmMSG_Bloc(),
      child: BlocBuilder<ECmMSG_Bloc, String>(
        builder: (context, msg) {
          return Page15Body(
            data: data,
            msg: msg,
          );
        },
      ),
    );
  }
}

class Page15Body extends StatelessWidget {
  Page15Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  ECmReceive? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return ECmMAIN(
      data: data,
      msg: msg,
    );
  }
}
