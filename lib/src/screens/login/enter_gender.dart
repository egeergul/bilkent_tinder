import 'package:bilkent_tinder/controllers/auth_controller.dart';
import 'package:bilkent_tinder/src/models/response_model.dart';
import 'package:bilkent_tinder/src/utils/colors.dart';
import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:bilkent_tinder/src/widgets/custom_loader.dart';
import 'package:bilkent_tinder/src/widgets/show_custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterGenderScreen extends StatefulWidget {
  @override
  _EnterGenderScreenState createState() => _EnterGenderScreenState();
}

class _EnterGenderScreenState extends State<EnterGenderScreen> {
  String _text = '';
  bool _isButtonDisabled = true;

  void _updateText(String newText) {
    setState(() {
      _text = newText;
      _isButtonDisabled = newText.isEmpty;
    });
  }

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
            authController.updateUserInfo("firstName", _text);
            Get.toNamed("enter_bday");
            
          }

          return !authController.isLoading
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What's your gender?",
                        style: TextStyle(
                            fontSize: Dimensions.font26,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: Dimensions.height30 * 1.5),
                      TextField(
                        onChanged: _updateText,
                        decoration: const InputDecoration(
                          hintText: 'e.g. John',
                        ),
                      ),
                      SizedBox(height: Dimensions.height30),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "This is how it'll appear on your profile. ",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            TextSpan(
                              text: "Can't change it later. ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.height15),
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
}
