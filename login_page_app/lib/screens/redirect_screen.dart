import 'package:flutter/material.dart';

class RedirectScreen extends StatelessWidget {
  //const RedirectScreen({Key? key}) : super(key: key)
  final String textHandler;

  RedirectScreen(this.textHandler);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample Page"),
      ),
      body: Container(
        width: double.infinity,
        height: 200,
        padding: const EdgeInsets.all(20),
        child: Text("Redirect from `$textHandler`"),
      ),
    );
  }
}
