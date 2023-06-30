import 'package:bilkent_tinder/src/data/api/api_client.dart';
import 'package:bilkent_tinder/src/models/user_model.dart';
import 'package:bilkent_tinder/src/utils/app_constants.dart';
import 'package:get/get_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  // Future<Response> registration(SignUpBody signUpBody) async {
  //   return await apiClient.postData(
  //       AppConstants.REGISTERATION_URI, signUpBody.toJson());
  // }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN) && sharedPreferences.containsKey(AppConstants.LOGGED_IN);
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstants.TOKEN) ?? "None";
  }

  Future<Response> login(String email) async {
    return await apiClient.postData(AppConstants.LOGIN_URI, {"email": email});
  }

  Future<Response> verify(String email, String code) async {
    return await apiClient.postData(
        AppConstants.VERIFY_URI, {"email": email, "verificationNumber": code});
  }

  Future<Response> completeLogin(String email) async {
    return await apiClient
        .postData(AppConstants.COMPLETE_LOGIN_URI, {"email": email});
  }

  Future<Response> completeSignUp(UserModel user) async {
    return await apiClient
        .postData(AppConstants.COMPLETE_SIGNUP_URI,  user.toJson());
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<bool> setLoggedIn() async {
    return await sharedPreferences.setString(AppConstants.LOGGED_IN, "true");
  }

  Future<bool> setUserExist(String value) async {
    return await sharedPreferences.setString(AppConstants.USER_EXIST, value);
  }

  Future<String> getUserExist() async {
    return await sharedPreferences.getString(AppConstants.USER_EXIST) ?? "None";
  }

  // Future<Response> deleteAccount(String email) async {
  //   return await apiClient
  //       .deleteData(AppConstants.DELETE_ACCOUNT + "/${email}");
  // }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.TOKEN);

    apiClient.token = '';

    apiClient.updateHeader('');
    return true;
  }
}
