import 'package:flutter/material.dart';
import 'package:news_app/User%20Screen/profile_screen.dart';
import 'package:news_app/screen/News%20Updates/news_home.dart';
import 'package:news_app/screen/News%20Updates/today_highlights.dart';
import 'package:news_app/screen/NewsCetegory/news_category.dart';
import 'package:news_app/screen/onboarding.dart';

import 'login.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Shield',
      initialRoute: '/',
      routes: {
        '/': (context) =>   SignInScreen(),
        '/home' : (context) =>  const NewsHome(),
        '/highlights' : (context) => const MoreTodayHighlights(),
        '/categories':(context) => const NewsCategoryScreen(),
        '/animatedList': (context) =>  const MoreTodayHighlights(),
        '/userProfile' : (context) => const UserProfile(),
      },
    );
  }
}

