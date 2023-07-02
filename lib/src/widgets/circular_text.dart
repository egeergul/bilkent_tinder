import 'package:flutter/material.dart';

class CircularText extends StatelessWidget {
  final bool hasIcon;
  final IconData iconData;
  final String text;
  final double textSize;

  CircularText({
    required this.hasIcon,
    required this.iconData,
    required this.text,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: hasIcon ? Icon(iconData) : null,
      label: Text(
        text,
        style: TextStyle(fontSize: textSize),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}
