import 'package:bilkent_tinder/controllers/auth_controller.dart';
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

enum Gender { woman, man }

class _EnterGenderScreenState extends State<EnterGenderScreen> {
  bool _isButtonDisabled = true;
  Gender? _gender;
  bool _showGender = false;

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
            if (_gender == Gender.man) {
              authController.updateUserInfo("gender", "man");
            } else if (_gender == Gender.woman) {
              authController.updateUserInfo("gender", "woman");
            } else {
              showCustomSnackBar("You have to select a gender!");
            }
            authController.updateUserInfo("showGender", _showGender);
            
            Get.toNamed("enter_sexual_orientation");
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
                      Column(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _gender = Gender.woman;
                                _isButtonDisabled = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0,
                              side: BorderSide(
                                color: _gender == Gender.woman
                                    ? AppColors.pink2
                                    : Colors.grey,
                                width: 1.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                'Woman',
                                style: TextStyle(
                                  color: _gender == Gender.woman
                                      ? AppColors.pink2
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _gender = Gender.man;
                                _isButtonDisabled = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0,
                              side: BorderSide(
                                color: _gender == Gender.man
                                    ? AppColors.pink2
                                    : Colors.grey,
                                width: 1.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                'Man',
                                style: TextStyle(
                                  color: _gender == Gender.man
                                      ? AppColors.pink2
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      ListTile(
                        title: Text('Show my gender on my profile'),
                        leading: Checkbox(
                          value: _showGender,
                          onChanged: (bool? value) {
                            setState(() {
                              _showGender = value!;
                            });
                          },
                        ),
                      ),
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
