import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/02-1-WeighBalance01Bloc.dart';
import '../bloc/BlocEvent/02-2-WeighBalance01MSG.dart';
import '02WeightBalance01/WeightBalance01MAIN.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page2BlocBody();
  }
}

class Page2BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page2BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => WeighBalance01Bloc_Bloc(),
        child: BlocBuilder<WeighBalance01Bloc_Bloc, WeighBalance01Receive>(
          builder: (context, data) {
            return Page2BlocMSG(
              data: data,
            );
          },
        ));
  }
}

class Page2BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page2BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  WeighBalance01Receive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => WeighBalance01MSG_Bloc(),
        child: BlocBuilder<WeighBalance01MSG_Bloc, String>(
          builder: (context, msg) {
            return Page2Body(
              data: data,
              msg: msg,
            );
          },
        ));
  }
}

class Page2Body extends StatelessWidget {
  Page2Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  WeighBalance01Receive? data;
  String? msg;
  @override
  Widget build(BuildContext context) {
    return WeightBalance01MAIN(
      data: data,
      msg: msg,
    );
  }
}
