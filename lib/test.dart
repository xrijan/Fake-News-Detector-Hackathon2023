import 'package:flutter/material.dart';

import 'colors.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: CustomColor.secondaryColor,
      body: Center(child: ElevatedButton(onPressed: () {}, child: Text("Hello")))
    );
  }
}
