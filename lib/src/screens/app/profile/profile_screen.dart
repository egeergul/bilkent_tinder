import 'package:bilkent_tinder/controllers/auth_controller.dart';
import 'package:bilkent_tinder/controllers/user_controller.dart';
import 'package:bilkent_tinder/src/models/response_model.dart';
import 'package:bilkent_tinder/src/models/user_model.dart';
import 'package:bilkent_tinder/src/screens/app/profile/about_me_widget.dart';
import 'package:bilkent_tinder/src/screens/app/profile/interests_widget.dart';
import 'package:bilkent_tinder/src/screens/app/profile/relationship_goals_widget.dart';
import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:bilkent_tinder/src/widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(body: GetBuilder<UserController>(builder: (userController) {
      return !userController.isLoading
          ? SingleChildScrollView(
              child: Column(children: [
              AboutMeWidget(user: Get.find<UserController>().user!),
              RelationshipGoalsWidget(),
              InterestsWidget(),
            ]))
          : CustomLoader();
    }));
  }
}
