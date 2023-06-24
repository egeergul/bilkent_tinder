import 'package:bilkent_tinder/src/utils/colors.dart';
import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:bilkent_tinder/src/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.pink3, AppColors.pink1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.all(Dimensions.height15 * 2),
          child: Column(children: [
            const Spacer(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'lib/assets/icons/tinder_icon.svg',
                    width: Dimensions.font20 * 1.5, // Set the desired width
                    height: Dimensions.font20  * 1.5, // Set the desired height
                    color: Colors.white, // Set the desired color
                  ),
                  SizedBox(width: Dimensions.width10 / 2,),
                  Text(
                    "Götür Sepeti",
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Tinder",
                        fontSize: Dimensions.font20 * 1.5),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: "By clicking Log In, you are agreeing with our ",
                  ),
                  TextSpan(
                      text: 'Terms',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed("terms_privacy")),
                  const TextSpan(
                      text: ". Learn how we process your data in our "),
                  TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed("terms_privacy")),
                ],
              ),
            ),
            CustomButton(
              text: "Log In With School Mail",
              onPressed: () => Get.toNamed("enter_mail"),
              iconData: Icons.mail,
              marginVertical: Dimensions.height15,
            ),
            TextButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Are you having trouble with logging in?'),
                  content:
                      const Text("Who cares! It's seems like a you problem."),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Fuck You!'),
                    ),
                  ],
                ),
              ),
              child: const Text(
                'Trouble logging in?',
                style: TextStyle(color: AppColors.white),
              ),
            ),
            SizedBox(
              width: 16.0,
              height: Dimensions.height30,
            )
          ]),
        ),
      ),
    );
  }
}
