import 'package:flutter/material.dart';
import 'package:news_app/colors.dart';

class AppBarWidgets extends StatefulWidget implements PreferredSizeWidget {
  IconData icon;
  String title = ' ';
  AppBarWidgets({required this.icon, required this.title, Key? key})
      : super(key: key);

  @override
  State<AppBarWidgets> createState() => _AppBarWidgetsState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetsState extends State<AppBarWidgets> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(widget.icon,color: Colors.black,),
      ),
      title: Text(widget.title,style: const TextStyle(color: Colors.black),),
      elevation: 0,
      backgroundColor: CustomColor.primaryColor,
    );
  }
}
