
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/User%20Screen/profile_screen.dart';
import 'package:news_app/screen/News%20Updates/news_home.dart';
import 'package:news_app/screen/News%20Updates/today_highlights.dart';
import 'package:news_app/screen/NewsCetegory/news_category.dart';
import 'package:provider/provider.dart';
import 'helper/user_provider.dart';
import 'screen/login.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User Data App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const LogInScreen(),
          '/home': (context) =>    const NewsHome(),
          '/highlights' : (context) =>  const MoreTodayHighlights(),
          '/categories':(context) =>  NewsCategoryScreen(),
          '/animatedList': (context) =>   MoreTodayHighlights(),
          '/ui' : (context) => const ProfileUi(),
        },
      ),
    );
  }
}

