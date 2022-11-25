import 'package:flutter/material.dart';

class Page13 extends StatelessWidget {
  const Page13({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page13Body();
  }
}

class Page13Body extends StatelessWidget {
  const Page13Body({Key? key}) : super(key: key);

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
