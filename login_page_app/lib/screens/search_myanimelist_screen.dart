// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_page_app/components/MyAnimeList/anime_page.dart';
import 'package:login_page_app/model/animelistmodel.dart';
import 'package:login_page_app/services/api_service.dart';

class SearchMyanimelistScreen extends StatefulWidget {
  const SearchMyanimelistScreen({Key? key}) : super(key: key);

  @override
  State<SearchMyanimelistScreen> createState() =>
      _SearchMyanimelistScreenState();
}

class _SearchMyanimelistScreenState extends State<SearchMyanimelistScreen> {
  List<Anime> list = [];
  final searchTextController = TextEditingController();
  late String searchText;
  late bool isResultempty = false;
  final String noResultMessage = "No results found.";

  @override
  void initState() {
    super.initState();
    searchText = "";
    doSearch();
  }

  void doSearch() async {
    final response = await ApiService().get(
        path: "https://api.jikan.moe/v4/anime", q: searchTextController.text);
    var body = jsonDecode(response.body);
    //print(body["pagination"]["items"]["count"]);
    if (response.statusCode == 200 &&
        body["pagination"]["items"]["count"] > 0) {
      var model = AnimeList.fromJson(body);
      setState(() {
        isResultempty = false;
        list = model.animeList;
      });
    } else {
      setState(() {
        isResultempty = true;
        list = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Container(
          child: TextField(
            controller: searchTextController,
            decoration: const InputDecoration(
              hintText: "Search",
              isDense: true,
              contentPadding: EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.white),
              ),
            ),
            onSubmitted: (value) {
              doSearch();
            },
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: doSearch,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: isResultempty,
              child: Text(noResultMessage),
            ),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: List<Widget>.generate(
                    list.length,
                    (index) => GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AnimePage(
                                title: list[index].title,
                                synopsis: list[index].synopsis,
                                imageUrl: list[index].imageUrl,
                              ),
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(list[index].imageUrl,
                                  fit: BoxFit.cover),
                            ),
                          ),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
