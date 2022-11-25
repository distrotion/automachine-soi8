import 'package:flutter/material.dart';

class Page16 extends StatelessWidget {
  const Page16({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page16Body();
  }
}

class Page16Body extends StatelessWidget {
  const Page16Body({Key? key}) : super(key: key);

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
