import 'package:bilkent_tinder/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<AuthController>(builder: (authController) {
      void _logout (){
        authController.clearSharedData();
        Get.toNamed("welcome");
      }
      return Center(
          child: OutlinedButton(child: Text("LOGOUT"), onPressed: _logout));
    }));
  }
}
