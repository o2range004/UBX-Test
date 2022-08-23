import 'dart:convert';
import 'dart:math';


import 'package:training_app/services/api_services.dart';

import '../model/animelistmodel.dart';

abstract class ApiRepository {
  Future fetchAnime(String searchparam);
}

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future fetchAnime(String searchparam) async {
    final response = await ApiService()
        .get(path: "https://api.jikan.moe/v4/anime", q: searchparam);
    var body = jsonDecode(response.body);
    if (response.statusCode == 200 &&
        body["pagination"]["items"]["count"] > 0) {
      var model = AnimeList.fromJson(body);
      return {"isResultempty": false, "list": model.animeList};
    } else if(response.statusCode == 200 && body['pagination']['items']['count'] == 0 ){
      return {"isResultempty": true, "list": []};
    } else {
      throw Exception('Error');
    }
  }
}
