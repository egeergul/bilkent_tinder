import 'package:bilkent_tinder/src/utils/colors.dart';
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
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
        side: BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
    );
  }
}
