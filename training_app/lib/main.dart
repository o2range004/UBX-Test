import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/constants.dart';
import 'package:training_app/routes/route_list.dart';
import 'package:training_app/routes/routes.dart';

void main() => runApp(
      const TrainingApp(),
    );

class TrainingApp extends StatefulWidget {
  const TrainingApp({Key? key}) : super(key: key);

  @override
  State<TrainingApp> createState() => _TrainingAppState();
}

class _TrainingAppState extends State<TrainingApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flutter Training App",
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
      ),
      getPages: Routes.routes,
      initialRoute: RouteList.LOGIN,
    );
  }
}
