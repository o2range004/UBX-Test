import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:training_app/components/common/form_button.dart';
import 'package:training_app/screens/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  //const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: controller.doLogout,
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Hi visitor!"),
              const SizedBox(
                height: 20,
              ),
              Text(controller.email.toString()),
              Text(controller.password.toString()),
              const SizedBox(
                height: 100,
              ),
              FormButton(
                  buttonText: "Go to Keyboard Exercise",
                  clickhandler: controller.goToKeyboardExercise,
                  height: 40,
                  width: double.infinity),
              const SizedBox(
                height: 30,
              ),
              FormButton(
                  buttonText: "Go to My AnimeList",
                  clickhandler: controller.goToMyAnimeList,
                  height: 40,
                  width: double.infinity),
            ],
          ),
        ),
      ),
    );
  }
}