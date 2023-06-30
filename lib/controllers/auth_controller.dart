import 'package:bilkent_tinder/src/data/repositories/auth_repo.dart';
import 'package:bilkent_tinder/src/models/response_model.dart';
import 'package:bilkent_tinder/src/models/user_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Map<String, dynamic> _userInfo = {};

  
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


  Future<ResponseModel> verify(String code ) async {
    _isLoading = true;
    update();
   
    Response response = await authRepo.verify( _userInfo["email"] , code);
    Map responseBody = response.body;
     
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(responseBody["token"]);
      responseModel = ResponseModel(true, responseBody["message"]);
    } else {
      responseModel = ResponseModel(false, responseBody["error"]!);
    }
    _isLoading = false;
    update();
    return responseModel;
    
  }

  
  Future<ResponseModel> completeLogin( ) async {
    _isLoading = true;
    update();   
    Response response = await authRepo.completeLogin( _userInfo["email"] );
    Map responseBody = response.body;
     
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(responseBody["token"]);
      responseModel = ResponseModel(true, responseBody["message"]);
    } else {
      responseModel = ResponseModel(false, responseBody["error"]!);
    }
    _isLoading = false;
    update();
    return responseModel;
    
  }


 Future<ResponseModel> completeSignUp( ) async {
    _isLoading = true;
    update();   

    UserModel user = UserModel(
      id: -1,
      firstName: _userInfo["firstName"],
      email: _userInfo["email"],
      sexualOrientation: _userInfo["sexualOrientation"],
      showOrientation: _userInfo["showOrientation"],
      gender: _userInfo["gender"],
      showGender: _userInfo["showGender"],
      birthDay: _userInfo["birthDay"],
      interests: ["home workout", "netflix", "baking", "volunteering", "broadway"],
      lookingFor: _userInfo["lookingFor"],
      interestedInSeeing: _userInfo["interestedInSeeing"],
      
    );


    Response response = await authRepo.completeSignUp( user );

    Map responseBody = response.body;
    print(responseBody);
     
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(responseBody["token"]);
      authRepo.setLoggedIn();
      responseModel = ResponseModel(true, responseBody["message"]);
    } else {
      responseModel = ResponseModel(false, responseBody["error"]!);
    }
    _isLoading = false;
    update();
    return responseModel;
    
  }
  
  Future<String> canLogin() async {
    return await authRepo.getUserExist();
  }
 
  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }

  void updateUserInfo(String key, dynamic value) {
    _userInfo[key] = value;
  }

  Map<String, dynamic> getUserInfo() {
    return _userInfo;
  }

  // Future<Response> deleteAccount(String email) async {
  //   return await authRepo.deleteAccount(email);
  // }
}
