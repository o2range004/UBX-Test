

import 'package:get/instance_manager.dart';
import 'package:training_app/screens/keyboard_exercise/controller/keyboard_controller.dart';

class KeyboardBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<KeyboardController>(() => KeyboardController());
  }
}