import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/12-1-AUTOTITRATEBloc.dart';
import '../bloc/BlocEvent/12-2-AUTOTITRATEMSG.dart';
import '12AUTOTITRATE/AUTOTITRATEMAIN.dart';

class Page12 extends StatelessWidget {
  const Page12({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page12BlocBody();
  }
}

class Page12BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page12BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AUTOTITRATEBloc_Bloc(),
      child: BlocBuilder<AUTOTITRATEBloc_Bloc, AUTOTITRATEReceive>(
        builder: (context, data) {
          return Page12BlocMSG(
            data: data,
          );
        },
      ),
    );
  }
}

class Page12BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page12BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  AUTOTITRATEReceive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AUTOTITRATEMSG_Bloc(),
      child: BlocBuilder<AUTOTITRATEMSG_Bloc, String>(
        builder: (context, msg) {
          return Page12Body(
            data: data,
            msg: msg,
          );
        },
      ),
    );
  }
}

class Page12Body extends StatelessWidget {
  Page12Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  AUTOTITRATEReceive? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return AUTOTITRATEMAIN(
      data: data,
      msg: msg,
    );
  }
}
