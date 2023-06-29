

import 'dart:async';
import 'package:bilkent_tinder/controllers/auth_controller.dart';
import 'package:bilkent_tinder/src/utils/colors.dart';
import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResources() async {
   // TODO
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
    controller = new AnimationController(
        vsync: this, duration: const Duration(seconds: 2))
      ..forward();
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(const Duration(seconds: 3), () {
      if (Get.find<AuthController>().userLoggedIn()) {
        // Get.offNamed("");
        Get.toNamed("rules");
      } else {
        Get.toNamed("welcome");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pink2,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(
                  child: Image.asset(
                "lib/assets/images/tinder_logo.png",
                width: Dimensions.splashImage,
              ))),
        ],
      ),
    );
  }
}
