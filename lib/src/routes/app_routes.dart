import 'package:bilkent_tinder/src/screens/home_screen.dart';
import 'package:bilkent_tinder/src/screens/login/verification_screen.dart';
import 'package:bilkent_tinder/src/screens/splash/splash_screen.dart';

import 'package:bilkent_tinder/src/screens/terms_privacy.dart';
import 'package:bilkent_tinder/src/screens/welcome_screen.dart';
import 'package:bilkent_tinder/src/screens/login/enter_mail_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: "/splash", page: () => const SplashScreen() ),


    GetPage(name: "/", page: () => HomeScreen() ),

    GetPage(name: "/welcome", page: () => const WelcomeScreen() ),
    GetPage(name: "/enter_mail", page: () =>  EnterMailScreen()),
    GetPage(name: "/verification", page: () =>   VerificationScreen()),

    GetPage(name: "/terms_privacy", page: ()=> const TermsAndPrivacy())

  ];
}