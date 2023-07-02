import 'package:bilkent_tinder/src/data/repositories/auth_repo.dart';
import 'package:bilkent_tinder/src/data/repositories/user_repo.dart';
import 'package:bilkent_tinder/src/models/response_model.dart';
import 'package:bilkent_tinder/src/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({required this.userRepo});


  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user; 
  bool get isLoading => _isLoading; 

  Future<ResponseModel> getUserInfo() async {
    _isLoading = true;
    update();
    Response response = await userRepo.getUserInfo();
   

    ResponseModel responseModel;
    if (response.statusCode == 200) {
      _user = UserModel.fromJson(response.body); 
      _isLoading = false;
      update();
      responseModel = ResponseModel(true, "successfully");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
      _isLoading = false;
      update();
    }

    return responseModel;
  }
}
