import 'package:bilkent_tinder/src/utils/app_constants.dart';
import 'package:bilkent_tinder/src/utils/colors.dart';
import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:bilkent_tinder/src/widgets/custom_action_button.dart';
import 'package:bilkent_tinder/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.cancel_outlined, color: Colors.black),
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/welcome', (Route route) => false)
          )
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.width30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'lib/assets/icons/tinder_icon.svg',
              width: Dimensions.font20 * 2, // Set the desired width
              height: Dimensions.font20 * 2, // Set the desired height
              color: AppColors.pink2, // Set the desired color
            ),
            SizedBox(height: Dimensions.height20),
            
            Text(
              "Welcome to ${AppConstants.APP_NAME}",
              style: TextStyle(fontSize: Dimensions.font26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: Dimensions.height10/2,),
            const Text("Please follow these House Rules"),
            SizedBox(height: Dimensions.height20),

            const Text("Be yourself.", style: TextStyle( fontWeight: FontWeight.bold)),
            SizedBox(height: Dimensions.height10 / 2),
            const Text( "Make sure your photos, age, and bio are true to who you are."),
            SizedBox(height: Dimensions.height20),


            const Text("Stay safe.",  style: TextStyle( fontWeight: FontWeight.bold)),
            SizedBox(height: Dimensions.height10 / 2),
            const Text("Don't be too quick to give out personal information."),
            SizedBox(height: Dimensions.height20),


            const Text("Play it cool.",  style: TextStyle( fontWeight: FontWeight.bold)),
            SizedBox(height: Dimensions.height10/2),
            const Text(
                "Respect others and treat them as you would like to be treated."),
            SizedBox(height: Dimensions.height20),

            const Text("Be proactive.", style: TextStyle( fontWeight: FontWeight.bold)),
            SizedBox(height: Dimensions.height10/2),
            const Text(
                "Always report bad behavior to someone. But not to us. Again, we don't take any responsibility."),
            Expanded(child: Container(),),
            
            CustomButton(text: "I agree", onPressed: ()=> {
              Get.toNamed("enter_name")
            }, backgroundColor: AppColors.pink2, textColor: AppColors.white,),
            SizedBox(height: Dimensions.height20),


            
          ],
        ),
      ),
    );
  }
}
