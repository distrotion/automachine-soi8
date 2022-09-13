import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/03-1-WeighBalance02Bloc.dart';
import '../bloc/BlocEvent/03-2-WeighBalance02MSG.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page3BlocBody();
  }
}

class Page3BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page3BlocBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => WeighBalance02Bloc_Bloc(),
        child: BlocBuilder<WeighBalance02Bloc_Bloc, WeighBalance02Receive>(
          builder: (context, data) {
            return Page3BlocMSG(
              data: data,
            );
          },
        ));
  }
}

class Page3BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page3BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  WeighBalance02Receive? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => WeighBalance02MSG_Bloc(),
        child: BlocBuilder<WeighBalance02MSG_Bloc, String>(
          builder: (context, msg) {
            return Page3Body(
              data: data,
              msg: msg,
            );
          },
        ));
  }
}

class Page3Body extends StatelessWidget {
  Page3Body({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  WeighBalance02Receive? data;
  String? msg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.green,
        child: const Text("PAGE 3"),
      ),
    );
  }
}
