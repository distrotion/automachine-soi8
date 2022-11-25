import 'package:flutter/material.dart';

class Page19 extends StatelessWidget {
  const Page19({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page19Body();
  }
}

class Page19Body extends StatelessWidget {
  const Page19Body({Key? key}) : super(key: key);

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
