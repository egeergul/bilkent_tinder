import 'package:bilkent_tinder/src/models/user_model.dart';
import 'package:bilkent_tinder/src/utils/colors.dart';
import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AboutMeWidget extends StatelessWidget {
  final UserModel user;
  const AboutMeWidget({super.key, required this.user});


  @override
  Widget build(BuildContext context) {
    return Container(
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
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: "${user.firstName} ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font26,
                        color: AppColors.grey),
                  ),
                  TextSpan(
                    text:
                        "${(DateTime.now().difference(user.birthDay!).inDays / 365).floor()} ",
                    style: TextStyle(
                        fontSize: Dimensions.font20, color: AppColors.grey),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            user.showGender! || user.showOrientation!
                ? Row(
                    children: [
                      const Icon(Icons.person_outline_rounded),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      Text(
                        "${user.showOrientation! ? user.sexualOrientation!.join(", " ) : ''} ${user.showGender! ? user.gender : ''}",
                        style: TextStyle(fontSize: Dimensions.font16),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(
              height: Dimensions.height20,
            ),
            Text(
              "About Me",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.font16 * 1.2),
            ),
            
            user.bio != null ?
            Text(
              user.bio!,
              style: TextStyle(fontSize: Dimensions.font16),
            ): Container(),
          ]),
    );
  }
}
