import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:training_app/model/animelistmodel.dart';
import 'package:training_app/routes/route_list.dart';
import 'package:training_app/services/api_repository.dart';

class MyAnimeListController extends GetxController {
  RxList<Anime> list = <Anime>[].obs;
  RxBool isResultempty = false.obs;
  final searchTextController = TextEditingController();
  late String searchText;
  final String noResultMessage = "No reuslts found";
  ApiRepository service;

  MyAnimeListController({required this.service});

  @override
  void onInit() {
    doSearch();
    super.onInit();
  }

  Future doSearch() async {
    /*final response = await ApiService().get(
        path: "https://api.jikan.moe/v4/anime", q: searchTextController.text);
    var body = jsonDecode(response.body);
    if (response.statusCode == 200 &&
        body["pagination"]["items"]["count"] > 0) {
      var model = AnimeList.fromJson(body);
      isResultempty.value = false;
      list.assignAll(model.animeList);
    } else {
      isResultempty.value = true;
      list.assignAll([]);
    }*/
    final result = await service.fetchAnime(searchTextController.text);
    isResultempty.value = result['isResultempty'];
    list.assignAll(result['list']);
  }

  void goToAnimePage(title, synopsis, imageUrl) {
    Get.toNamed(RouteList.ANIMEPAGE, parameters: {
      "title": title,
    }, arguments: {
      "synopsis": synopsis,
      "imageUrl": imageUrl,
    });
  }
}
