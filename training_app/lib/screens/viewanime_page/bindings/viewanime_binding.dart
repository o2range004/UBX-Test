import 'package:get/instance_manager.dart';
import 'package:training_app/screens/viewanime_page/controller/viewanime_controller.dart';

class ViewAnimeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewAnimecController>(() => ViewAnimecController());
  }
}
