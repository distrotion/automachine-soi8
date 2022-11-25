import 'package:flutter/material.dart';

class Page17 extends StatelessWidget {
  const Page17({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page17Body();
  }
}

class Page17Body extends StatelessWidget {
  const Page17Body({Key? key}) : super(key: key);

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
