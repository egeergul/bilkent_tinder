
import 'package:bilkent_tinder/controllers/auth_controller.dart';
import 'package:bilkent_tinder/src/data/api/api_client.dart';
import 'package:bilkent_tinder/src/data/repositories/auth_repo.dart';
import 'package:bilkent_tinder/src/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // api
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  
  // repos
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  
  // controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));

}
