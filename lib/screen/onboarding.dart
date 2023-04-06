//by akshya

import 'package:flutter/material.dart';
import 'package:news_app/colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => OnBoardingState();
}

class OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: CustomColor.primaryColor,
    );
  }
}
