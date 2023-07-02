import 'package:bilkent_tinder/src/utils/colors.dart';
import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

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
                    text: 'Ege ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font26,
                        color: AppColors.grey),
                  ),
                  TextSpan(
                    text: '21 ',
                    style: TextStyle(
                        fontSize: Dimensions.font20, color: AppColors.grey),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Row(
              children: [
                Icon(Icons.person_outline_rounded),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Text(
                  "Questioning man",
                  style: TextStyle(fontSize: Dimensions.font16),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Text(
              "About Me",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.font16 * 1.2),
            ),
            Text(
              "Lorem10! AGa mafk sfks lksdfş ksşke şsdlmfş",
              style: TextStyle(fontSize: Dimensions.font16),
            ),
          ]),
    );
  }
}
