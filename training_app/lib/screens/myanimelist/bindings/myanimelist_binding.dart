import 'package:get/instance_manager.dart';
import 'package:training_app/screens/myanimelist/controller/myanimelist_controller.dart';

class MyAnimeListBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<MyAnimeListController>(() => MyAnimeListController());
  }
}