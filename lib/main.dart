import 'package:flutter/material.dart';
import 'package:news_app/screen/News%20Updates/news_home.dart';
import 'package:news_app/screen/News%20Updates/today_highlights.dart';
import 'package:news_app/screen/NewsCetegory/news_category.dart';
import 'package:news_app/test.dart';
import 'colors.dart';

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
        '/': (context) => const NewsHome(),
        '/highlights' : (context) => const MoreTodayHighlights(),
        '/categories':(context) => const NewsCategoryScreen(),
        '/animatedList': (context) =>  const MoreTodayHighlights(),
        '/test' : (context) => const Test(),
      },
    );
  }
}

