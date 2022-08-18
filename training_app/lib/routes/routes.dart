

import 'package:get/route_manager.dart';
import 'package:training_app/routes/route_list.dart';
import 'package:training_app/screens/home/bindings/home_bindings.dart';
import 'package:training_app/screens/home/view/home_page.dart';
import 'package:training_app/screens/keyboard_exercise/bindings/keyboard_binding.dart';
import 'package:training_app/screens/keyboard_exercise/view/keyboard_page.dart';
import 'package:training_app/screens/login/bindings/login_bindings.dart';
import 'package:training_app/screens/login/view/login_page.dart';
import 'package:training_app/screens/myanimelist/bindings/myanimelist_binding.dart';
import 'package:training_app/screens/myanimelist/view/myanimelist_page.dart';
import 'package:training_app/screens/viewanime_page/bindings/viewanime_binding.dart';
import 'package:training_app/screens/viewanime_page/view/viewanime_page.dart';

class Routes{
  static List<GetPage> routes = [
    GetPage(name: RouteList.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: RouteList.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: RouteList.KEYBOARD, page: () => KeyboardPage(), binding: KeyboardBinding()),
    GetPage(name: RouteList.MYANIMELIST, page: () => MyAnimeListPage(), binding: MyAnimeListBinding()),
    GetPage(name: RouteList.ANIMEPAGE, page: () => ViewAnimePage(), binding: ViewAnimeBinding()),
  ];
}