import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:training_app/screens/myanimelist/controller/myanimelist_controller.dart';

class MyAnimeListPage extends GetView<MyAnimeListController> {
  const MyAnimeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          titleSpacing: 0,
          title: Container(
            child: TextField(
              controller: controller.searchTextController,
              decoration: const InputDecoration(
                hintText: "Search",
                isDense: true,
                contentPadding: EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white),
                ),
              ),
              onSubmitted: (value) {
                controller.doSearch();
              },
            ),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: controller.doSearch,
              icon: const Icon(Icons.search),
            ),
          ]),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Visibility(
                  visible: controller.isResultempty.value,
                  child: Text(controller.noResultMessage),
                )),
            Obx(() => Expanded(
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    children: List<Widget>.generate(
                      controller.list.length,
                      (index) => GestureDetector(
                        onTap: () => controller.goToAnimePage(
                            controller.list[index].title,
                            controller.list[index].synopsis,
                            controller.list[index].imageUrl),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                                controller.list[index].imageUrl,
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
