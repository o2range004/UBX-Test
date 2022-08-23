import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:training_app/model/animelistmodel.dart';
import 'package:training_app/screens/myanimelist/controller/myanimelist_controller.dart';
import 'package:training_app/services/api_repository.dart';

import 'api_repository_test.mocks.dart';

class ApiRepositoryTest extends Mock implements ApiRepository {}

@GenerateMocks([ApiRepositoryTest])
Future<void> main() async {
  late MockApiRepositoryTest apiRepo;
  late MyAnimeListController myAnimeListController;

  setUpAll(() {
    apiRepo = MockApiRepositoryTest();
    myAnimeListController = MyAnimeListController(service: apiRepo);
  });

  group("Api Testing", () {
    test("Test fetch anime if returns an animelist", () async {
      String searchparam = "Madoka";
      final model = AnimeList(animeList: []);
      when(apiRepo.fetchAnime(searchparam)).thenAnswer((_) async {
        return model;
      });
      final response = await apiRepo.fetchAnime(searchparam);
      expect(response, isA<AnimeList>());
      expect(response, model);
    });
    test("Test Fetch Anime Error", () async {
      String searchparam = "Naruto";
      when(apiRepo.fetchAnime(searchparam)).thenAnswer((_) async {
        return "Error";
      });
      final response = await apiRepo.fetchAnime(searchparam);
      expect(response, isA<String>());
      expect(response, "Error");
    });
  });
  group("Controller Testing", () {
    test("Do Search but result is empty", () async {
      when(apiRepo.fetchAnime("")).thenAnswer((_) async {
        return {"isResultempty": true, "list": <Anime>[].obs};
      });
      await myAnimeListController.doSearch();
      expect(myAnimeListController.list.length, 0);
      expect(myAnimeListController.isResultempty, true.obs);
    });

    test("DO Search but fetch anime throws exception", () {
      when(apiRepo.fetchAnime("")).thenAnswer((_) async {
        throw Exception("Error");
      });
      final res = myAnimeListController.doSearch();
      expect(res, throwsException);
    });
  });
}
