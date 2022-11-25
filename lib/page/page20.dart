import 'package:flutter/material.dart';

class Page20 extends StatelessWidget {
  const Page20({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page20Body();
  }
}

class Page20Body extends StatelessWidget {
  const Page20Body({Key? key}) : super(key: key);

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
