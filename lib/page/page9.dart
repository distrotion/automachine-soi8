import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/09-1-DENSITYBloc.dart';
import '../bloc/BlocEvent/09-2-DENSITYMSG.dart';
import '09DENSITY/DENSITYMAIN.dart';

class Page9 extends StatelessWidget {
  const Page9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page9BlocBody();
  }
}

class Page9BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page9BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => DENSITYBloc_Bloc(),
        child: BlocBuilder<DENSITYBloc_Bloc, DENSITYReceive>(
          builder: (context, data) {
            return Page9BlocMSG(
              data: data,
            );
          },
        ));
  }
}

class Page9BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page9BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  DENSITYReceive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DENSITYMSG_Bloc(),
      child: BlocBuilder<DENSITYMSG_Bloc, String>(
        builder: (context, msg) {
          return Page9Body(
            data: data,
            msg: msg,
          );
        },
      ),
    );
  }
}

class Page9Body extends StatelessWidget {
  Page9Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  DENSITYReceive? data;
  String? msg;
  @override
  Widget build(BuildContext context) {
    return DENSITYMAIN(
      data: data,
      msg: msg,
    );
  }
}
