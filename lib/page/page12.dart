import 'package:flutter/material.dart';

class Page12 extends StatelessWidget {
  const Page12({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page12Body();
  }
}

class Page12Body extends StatelessWidget {
  const Page12Body({Key? key}) : super(key: key);

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
