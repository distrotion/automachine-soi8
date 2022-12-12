import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/14-1-MINIAVBloc.dart';
import '../bloc/BlocEvent/14-2-MINIAVMSG.dart';
import '14MINIAV/MINIAVMAIN.dart';

class Page14 extends StatelessWidget {
  const Page14({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page14BlocBody();
  }
}

class Page14BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page14BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MINIAVBloc_Bloc(),
      child: BlocBuilder<MINIAVBloc_Bloc, MINIAVReceive>(
        builder: (context, data) {
          return Page14BlocMSG(
            data: data,
          );
        },
      ),
    );
  }
}

class Page14BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page14BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  MINIAVReceive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MINIAVMSG_Bloc(),
      child: BlocBuilder<MINIAVMSG_Bloc, String>(
        builder: (context, msg) {
          return Page14Body(
            data: data,
            msg: msg,
          );
        },
      ),
    );
  }
}

class Page14Body extends StatelessWidget {
  Page14Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  MINIAVReceive? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return MINIAVMAIN(
      data: data,
      msg: msg,
    );
  }
}
