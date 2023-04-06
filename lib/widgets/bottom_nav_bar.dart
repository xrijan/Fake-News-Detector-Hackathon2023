import 'package:flutter/material.dart';
import 'package:news_app/colors.dart';
import 'package:news_app/screen/NewsCetegory/news_category.dart';

class CustomNavBar extends StatefulWidget {
  final int index;
  const CustomNavBar({Key? key , required this.index}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      backgroundColor: CustomColor.primaryColor,
        currentIndex: widget.index,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(left: 50),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home),
                ),
              ),
              label: "home"),

          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/categories');
                },
                icon: const Icon(Icons.analytics),
              ),
              label: "Analysis"),

          BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(right: 50),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person),
                ),
              ),
              label: "Profile"),
        ]);
  }
}
