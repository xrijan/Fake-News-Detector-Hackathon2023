import 'package:flutter/material.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({
    Key? key,
    required this.backgroundColor,
    required this.children,
  }) : super(key: key);
  final Color backgroundColor;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:children,
      ),
    );
  }
}
