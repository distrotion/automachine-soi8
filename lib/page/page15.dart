import 'package:flutter/material.dart';

class Page15 extends StatelessWidget {
  const Page15({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page15Body();
  }
}

class Page15Body extends StatelessWidget {
  const Page15Body({Key? key}) : super(key: key);

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
