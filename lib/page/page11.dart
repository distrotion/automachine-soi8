import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/11-1-BALANCEaBloc.dart';
import '../bloc/BlocEvent/11-2-BALANCEaMSG.dart';
import '11BALANCEa/BALANCEaMAIN.dart';

class Page11 extends StatelessWidget {
  const Page11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page11BlocBody();
  }
}

class Page11BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page11BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BALANCEaBloc_Bloc(),
      child: BlocBuilder<BALANCEaBloc_Bloc, BALANCEaReceive>(
        builder: (context, data) {
          return Page11BlocMSG(
            data: data,
          );
        },
      ),
    );
  }
}

class Page11BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page11BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  BALANCEaReceive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BALANCEaMSG_Bloc(),
      child: BlocBuilder<BALANCEaMSG_Bloc, String>(
        builder: (context, msg) {
          return Page11Body(
            data: data,
            msg: msg,
          );
        },
      ),
    );
  }
}

class Page11Body extends StatelessWidget {
  Page11Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  BALANCEaReceive? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return BALANCEaMAIN(
      data: data,
      msg: msg,
    );
  }
}
