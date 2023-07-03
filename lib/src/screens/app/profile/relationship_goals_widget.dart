import 'package:bilkent_tinder/src/models/user_model.dart';
import 'package:bilkent_tinder/src/utils/colors.dart';
import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:bilkent_tinder/src/widgets/circular_text.dart';
import 'package:flutter/material.dart';

class RelationshipGoalsWidget extends StatelessWidget {
  final UserModel user;
  const RelationshipGoalsWidget({super.key, required this.user });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Dimensions.width20),
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: AppColors.lightGrey,
          width: 1.0,
        )),
      ),
      child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Relationship Goals",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.font16 * 1.2),
            ),
            SizedBox(height: Dimensions.height15,),
            CircularText(hasIcon: true, iconData: Icons.remove_red_eye, text: user.lookingFor!, textSize: Dimensions.font16)
          ]),
    );
  }
}
