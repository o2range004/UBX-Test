import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ViewAnimecController extends GetxController{
  final title = Get.parameters['title'].toString();
  final synopsis = Get.arguments['synopsis'].toString();
  final String imageUrl = Get.arguments['imageUrl'].toString();

}