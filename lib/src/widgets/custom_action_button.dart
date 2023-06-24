import 'package:bilkent_tinder/src/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomActionButton extends StatefulWidget {
  final VoidCallback toggleCallback;

  const CustomActionButton({required this.toggleCallback});

  @override
  _CustomActionButtonState createState() => _CustomActionButtonState();
}

class _CustomActionButtonState extends State<CustomActionButton> {
  bool isButtonDisabled = true;

  void toggleButton() {
    setState(() {
      isButtonDisabled = !isButtonDisabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isButtonDisabled
            ? null
            : () {
                print('Button Pressed!');
              },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.disabled; // Disabled background color
            }
            return AppColors.pink2; // Normal background color
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(100.0), // Set the border radius here
            ),
          ),
        ),
        child: const Text('CONTINUE'),
      ),
    );
  }
}
