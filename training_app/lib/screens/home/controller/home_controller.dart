import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:training_app/routes/route_list.dart';

class HomeController extends GetxController{
  final email = Get.arguments['email'];
  final password = Get.arguments['password'];
  /*String email = "";
  String password = "";
  @override
  void onInit() {
    // TODO: implement onInit
    email = Get.arguments['email'];
    password = Get.arguments['password'];
    super.onInit();
  }*/
  void goToKeyboardExercise(){
    Get.toNamed(RouteList.KEYBOARD);
  }

  void goToMyAnimeList(){
    Get.toNamed(RouteList.MYANIMELIST); 
  }

  void doLogout(){
    Get.toNamed(RouteList.LOGIN);
  }
}
