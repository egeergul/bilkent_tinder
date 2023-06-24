import 'package:bilkent_tinder/controllers/auth_controller.dart';
import 'package:bilkent_tinder/src/models/response_model.dart';
import 'package:bilkent_tinder/src/utils/colors.dart';
import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:bilkent_tinder/src/widgets/custom_loader.dart';
import 'package:bilkent_tinder/src/widgets/show_custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterMailScreen extends StatefulWidget {
  @override
  _EnterMailScreenState createState() => _EnterMailScreenState();
}

class _EnterMailScreenState extends State<EnterMailScreen> {
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
          void  _submitText() async {
            ResponseModel resp =  await authController.login(_text);
            if(resp.isSuccess) {
              authController.updateUserInfoForSignUp("email", _text);
              Get.toNamed("verification");
            } else {
              showCustomSnackBar(resp.message);
            }
           
           
          }
          return !authController.isLoading
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "My school mail is",
                        style: TextStyle(
                            fontSize: Dimensions.font26,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: Dimensions.height30 * 1.5),
                      TextField(
                        onChanged: _updateText,
                        decoration: const InputDecoration(
                          hintText: 'name.surname@ug.bilkent.edu.tr',
                        ),
                      ),
                      SizedBox(height: Dimensions.height30),
                      Text(
                        "When you tap Continue, Götür Sepeti will send you an e-mail with verification code. The verification code will be valid for 10 minutes.",
                        style: TextStyle(fontSize: Dimensions.font26 / 2),
                      ),
                      SizedBox(height: Dimensions.height15),
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            onPressed:
                                _isButtonDisabled ? null : () => _submitText(),
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
