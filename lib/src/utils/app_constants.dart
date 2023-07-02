// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String APP_NAME = "Götür Sepeti";
  static const int APP_VERSION = 1;

  static const String BASE_URL = "http://localhost:5000";

  // Auth Endpoints
  static const String LOGIN_URI = '/user/login';
  static const String VERIFY_URI = '/user/verify';
  static const String COMPLETE_LOGIN_URI = '/user/complete-login';
  static const String COMPLETE_SIGNUP_URI = '/user/complete-signup';
  
  // User Endpoints
  static const String USER_INFO_URI = "/user/";
  

  /*config*/
  static const String TOKEN = "TOKEN";
  static const String LOGGED_IN = "LOGGED_IN";
  static const String USER = "USER";
  static const String USER_EXIST = "USER_EXIST";

  
}
