import 'package:bilkent_tinder/src/screens/app/profile/profile_screen.dart';
import 'package:bilkent_tinder/src/screens/home_screen.dart';
import 'package:bilkent_tinder/src/screens/login/enter_bday.dart';
import 'package:bilkent_tinder/src/screens/login/enter_gender.dart';
import 'package:bilkent_tinder/src/screens/login/enter_im_looking_for.dart';
import 'package:bilkent_tinder/src/screens/login/enter_interested_gender.dart';
import 'package:bilkent_tinder/src/screens/login/enter_name_screen.dart';
import 'package:bilkent_tinder/src/screens/login/enter_sexual_orientation.dart';
import 'package:bilkent_tinder/src/screens/login/rules_screen.dart';
import 'package:bilkent_tinder/src/screens/login/verification_screen.dart';
import 'package:bilkent_tinder/src/screens/splash/splash_screen.dart';

import 'package:bilkent_tinder/src/screens/terms_privacy.dart';
import 'package:bilkent_tinder/src/screens/welcome_screen.dart';
import 'package:bilkent_tinder/src/screens/login/enter_mail_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    // Initial
    GetPage(name: "/splash", page: () => const SplashScreen() ),

    // Auth Related
    GetPage(name: "/welcome", page: () => const WelcomeScreen() ),
    GetPage(name: "/enter_mail", page: () =>  EnterMailScreen()),
    GetPage(name: "/verification", page: () =>   VerificationScreen()),
    GetPage(name: "/rules", page: () =>  const  RulesScreen()),
    GetPage(name: "/enter_name", page: () =>    EnterNameScreen()),
    GetPage(name: "/enter_bday", page: () =>  const EnterBdayScreen()),
    GetPage(name: "/enter_gender", page: () =>   EnterGenderScreen()),
    GetPage(name: "/enter_sexual_orientation", page: () =>   EnterSexualOrientationScreen()),
    GetPage(name: "/enter_interested_gender", page: () =>   EnterInterestedGenderScreen()),
    GetPage(name: "/enter_im_looking_for", page: () =>   EnterImLookingForScreen()),

    // App
    GetPage(name: "/", page: () => const HomeScreen() ),
    GetPage(name: "/profile", page: () => const ProfileScreen() ),

    // Extra
    GetPage(name: "/terms_privacy", page: ()=> const TermsAndPrivacy())

  ];
}