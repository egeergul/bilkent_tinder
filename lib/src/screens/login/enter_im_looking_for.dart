import 'package:bilkent_tinder/controllers/auth_controller.dart';
import 'package:bilkent_tinder/src/models/response_model.dart';
import 'package:bilkent_tinder/src/utils/colors.dart';
import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:bilkent_tinder/src/widgets/custom_loader.dart';
import 'package:bilkent_tinder/src/widgets/show_custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EnterImLookingForScreen extends StatefulWidget {
  @override
  _EnterImLookingForScreenState createState() =>
      _EnterImLookingForScreenState();
}

final Map<int, String> options = {
  0: "long-term partner",
  1: "long-term, open to short",
  2: "short-term, open to long",
  3: "short-term fun",
  4: "new friends",
  5: "still figuring it out"
};

final Map<int, String> optionEmojis = {
  0: "💘",
  1: "😍",
  2: "🥂",
  3: "🍑",
  4: "👋",
  5: "🤔"
};

class _EnterImLookingForScreenState extends State<EnterImLookingForScreen> {
  bool _isButtonDisabled = true;
  int _selectedOption = -1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: GetBuilder<AuthController>(builder: (authController) {
          void _submitText() async {
            authController.updateUserInfo("lookingFor", options[_selectedOption]);

            Get.toNamed("enter_interested_gender");
          }

          return !authController.isLoading
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Right now I'm looking for...",
                        style: TextStyle(
                            fontSize: Dimensions.font26,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: Dimensions.height10),
                      Text(
                        'Increase compatibility by sharing yours!',
                        style: TextStyle(
                            fontSize: Dimensions.font16, color: Colors.grey),
                      ),
                      SizedBox(height: Dimensions.height30),
                      _buildRow(0),
                      SizedBox(height: Dimensions.height10),
                      _buildRow(3),
                      Expanded(child: SizedBox()),
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            onPressed:
                                _isButtonDisabled ? null : () => _submitText(),
                            child: Text('NEXT'),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                backgroundColor: AppColors.pink2),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const CustomLoader();
        }));
  }

  Widget _buildRow(int startIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        final optionIndex = startIndex + index;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedOption = optionIndex;
              _isButtonDisabled = false;
            });
          },
          child: Container(
            width: Dimensions.screenWidth / 3 - 20.0,
            height: (Dimensions.screenWidth / 3 - 20.0) * 1.5,
            decoration: BoxDecoration(
              color: _selectedOption == optionIndex
                  ? AppColors.pink2
                  : AppColors.lightGrey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: optionEmojis[index], // emoji characters
                          style: TextStyle(
                            fontFamily: 'EmojiOne',
                            fontSize: Dimensions.font26
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    options[index]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.font16 - Dimensions.font16 / 7),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
