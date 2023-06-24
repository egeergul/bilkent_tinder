import 'package:bilkent_tinder/controllers/auth_controller.dart';
import 'package:bilkent_tinder/src/models/response_model.dart';
import 'package:bilkent_tinder/src/utils/colors.dart';
import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:bilkent_tinder/src/widgets/custom_loader.dart';
import 'package:bilkent_tinder/src/widgets/show_custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String _code = '';
  bool _onEditing = true;

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
            ResponseModel resp = await authController.verify(_code);
            if (resp.isSuccess) {
              if (await authController.canLogin() == "true") {
                // Login
                authController.completeLogin();
                Get.toNamed("");
              } else {
                // Sign Up
                Get.toNamed("welcome");

              }
            } else {
              showCustomSnackBar(resp.message);
            }
          }

          return !authController.isLoading
              ? Padding(
                  padding:  EdgeInsets.all(Dimensions.width30),
                  child: Column(
                    children: [
                      Text(
                        "My code is",
                        style: TextStyle(
                            fontSize: Dimensions.font26,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: Dimensions.height30),
                      Row(
                        children: [
                          Text( authController.getUserInfo()["email"]),
                          SizedBox(width: Dimensions.width15),

                          OutlinedButton(
                            onPressed: () { Navigator.of(context).pop();},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              side: const BorderSide(color: Colors.grey, width: 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                            child: const Text(
                              'RESEND',
                              style: TextStyle(color: Colors.black ),
                            ),
                          ),
                        ],
                      ),
                      VerificationCode(
                        textStyle:
                            TextStyle(fontSize: 20.0, color: Colors.red[900]),
                        keyboardType: TextInputType.number,
                        underlineColor: AppColors.pink2,
                        length: 6,
                        cursorColor: AppColors.pink1,
                        onCompleted: (String value) {
                          setState(() {
                            _code = value;
                          });
                        },
                        onEditing: (bool value) {
                          setState(() {
                            _onEditing = value;
                          });
                          if (!_onEditing) FocusScope.of(context).unfocus();
                        },
                      ),
                      SizedBox(height: Dimensions.height30),
                    

                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            onPressed:
                                _onEditing == true ? null : () => _submitText(),
                            child: Text('CONTINUE'),
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
