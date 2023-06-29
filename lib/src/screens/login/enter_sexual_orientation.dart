import 'package:bilkent_tinder/controllers/auth_controller.dart';
import 'package:bilkent_tinder/src/models/response_model.dart';
import 'package:bilkent_tinder/src/utils/colors.dart';
import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:bilkent_tinder/src/widgets/custom_loader.dart';
import 'package:bilkent_tinder/src/widgets/show_custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EnterSexualOrientationScreen extends StatefulWidget {
  @override
  _EnterSexualOrientationScreenState createState() =>
      _EnterSexualOrientationScreenState();
}

class _EnterSexualOrientationScreenState
    extends State<EnterSexualOrientationScreen> {
  bool _isButtonDisabled = true;
  bool _showOrientation = false;

  List<String> _selectedOptions = [];
  String capitalize(String text) {
    return text.isEmpty ? '' : text[0].toUpperCase() + text.substring(1);
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

            authController.updateUserInfo("showOrientation", _showOrientation);
            authController.updateUserInfo("sexualOrientation", _selectedOptions);
            Get.toNamed("enter_interested_gender");
          }

          return !authController.isLoading
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your sexual orientation?",
                        style: TextStyle(
                            fontSize: Dimensions.font26,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: Dimensions.height10 ),
                      const Text(
                        'Select up to 3',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          for (String option in [
                            'straight',
                            'gay',
                            'lesbian',
                            'bisexual',
                            'asexual',
                            'demisexual',
                            'pansexual',
                            'queer',
                            'questioning',
                          ])
                            Container(

                               decoration: const BoxDecoration(

                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                             

                              child: CheckboxListTile(
                                title: Text(capitalize(option)),
                                value: _selectedOptions.contains(option),
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (_selectedOptions.length < 3) {
                                        _selectedOptions.add(option);
                                      }
                                    } else {
                                      _selectedOptions.remove(option);
                                    }
                                    if (_selectedOptions.length >= 1) {
                                      _isButtonDisabled = false;
                                    } else {
                                      _isButtonDisabled = true;
                                    }
                                  });
                                },
                              ),
                            ),
                        ],
                      ),
                      ListTile(
                        title: Text(
                          'Show my gender on my profile',
                          style: TextStyle(fontSize: Dimensions.font16),
                        ),
                        leading: Checkbox(
                          value: _showOrientation,
                          onChanged: (bool? value) {
                            setState(() {
                              _showOrientation = value!;
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
