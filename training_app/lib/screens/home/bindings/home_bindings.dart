import 'package:get/instance_manager.dart';
import 'package:training_app/screens/home/controller/home_controller.dart';

class HomeBinding implements Bindings{
  
  @override
  void dependencies(){
    Get.lazyPut<HomeController>(() => HomeController());
  }
}