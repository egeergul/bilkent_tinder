import 'dart:convert';

import 'package:bilkent_tinder/src/data/repositories/auth_repo.dart';
import 'package:bilkent_tinder/src/models/response_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Map<String, dynamic> _userInfoForSignUp = {};

  
  Future<ResponseModel> login(String email ) async {
    _isLoading = true;
    update();
   
    Response response = await authRepo.login(email);
    Map responseBody = response.body;
     
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      await authRepo.setUserExist(responseBody["userExist"].toString());

      responseModel = ResponseModel(true, responseBody["message"]);
    } else {
      responseModel = ResponseModel(false, responseBody["error"]!);
    }
    _isLoading = false;
    update();
    return responseModel;
    
  }

 
  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }

  void updateUserInfoForSignUp(String key, dynamic value) {
    _userInfoForSignUp[key] = value;
  }

  Map<String, dynamic> getUserInfoForSignUp() {
    return _userInfoForSignUp;
  }

  // Future<Response> deleteAccount(String email) async {
  //   return await authRepo.deleteAccount(email);
  // }
}
