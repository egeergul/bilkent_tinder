import 'package:bilkent_tinder/controllers/auth_controller.dart';
import 'package:bilkent_tinder/src/utils/colors.dart';
import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:bilkent_tinder/src/widgets/custom_loader.dart';
import 'package:bilkent_tinder/src/widgets/show_custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterInterestedGenderScreen extends StatefulWidget {
  @override
  _EnterInterestedGenderScreenState createState() => _EnterInterestedGenderScreenState();
}

enum InterestedInSeeing { women, men, everyone }

class _EnterInterestedGenderScreenState extends State<EnterInterestedGenderScreen> {
  bool _isButtonDisabled = true;
  InterestedInSeeing? _gender;

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
            if (_gender == InterestedInSeeing.men) {
              authController.updateUserInfo("interestedInSeeing", "men");
            } else if (_gender == InterestedInSeeing.women) {
              authController.updateUserInfo("interestedInSeeing", "women");
            } else if (_gender == InterestedInSeeing.everyone) {
              authController.updateUserInfo("interestedInSeeing", "everyone");
            } else {
              showCustomSnackBar("You have to select a gender!");
            }
            Get.toNamed("enter_im_looking_for");
          }

          return !authController.isLoading
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Who are you interested in seeing?",
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
                                _gender = InterestedInSeeing.women;
                                _isButtonDisabled = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0,
                              side: BorderSide(
                                color: _gender == InterestedInSeeing.women
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
                                'Women',
                                style: TextStyle(
                                  color: _gender == InterestedInSeeing.women
                                      ? AppColors.pink2
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _gender = InterestedInSeeing.men;
                                _isButtonDisabled = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0,
                              side: BorderSide(
                                color: _gender == InterestedInSeeing.men
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
                                'Men',
                                style: TextStyle(
                                  color: _gender == InterestedInSeeing.men
                                      ? AppColors.pink2
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _gender = InterestedInSeeing.everyone;
                                _isButtonDisabled = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0,
                              side: BorderSide(
                                color: _gender == InterestedInSeeing.everyone
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
                                'Everyone',
                                style: TextStyle(
                                  color: _gender == InterestedInSeeing.everyone
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
