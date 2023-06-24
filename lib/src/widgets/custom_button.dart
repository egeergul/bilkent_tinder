import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final bool fullWidth;
  final IconData? iconData; 
  final double marginVertical;
  final double marginHorizontal;

  const CustomButton({
    required this.text,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.fullWidth = true,
    this.iconData,
    this.marginVertical = 0.0,
    this.marginHorizontal = 0.0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: marginVertical, horizontal:  marginHorizontal),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0), // Set the border radius here
              ),
            ),
            
            
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(12.0 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconData != null) 
                  Icon(iconData, color: textColor),
                const Spacer(),
                Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                const Spacer(),
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
