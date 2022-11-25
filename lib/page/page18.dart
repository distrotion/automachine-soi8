import 'package:flutter/material.dart';

class Page18 extends StatelessWidget {
  const Page18({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page18Body();
  }
}

class Page18Body extends StatelessWidget {
  const Page18Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.green,
      ),
    );
  }
}
