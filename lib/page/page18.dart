import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/18-1-PENETROMETERBloc.dart';
import '../bloc/BlocEvent/18-2-PENETROMETERMSG.dart';
import '18PENETROMETER/PENETROMETERMAIN.dart';

class Page18 extends StatelessWidget {
  const Page18({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page18BlocBody();
  }
}

class Page18BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page18BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PENETROMETERBloc_Bloc(),
      child: BlocBuilder<PENETROMETERBloc_Bloc, PENETROMETERReceive>(
        builder: (context, data) {
          return Page18BlocMSG(
            data: data,
          );
        },
      ),
    );
  }
}

class Page18BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page18BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  PENETROMETERReceive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PENETROMETERMSG_Bloc(),
      child: BlocBuilder<PENETROMETERMSG_Bloc, String>(
        builder: (context, msg) {
          return Page18Body(
            data: data,
            msg: msg,
          );
        },
      ),
    );
  }
}

class Page18Body extends StatelessWidget {
  Page18Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  PENETROMETERReceive? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return PENETROMETERMAIN();
  }
}
