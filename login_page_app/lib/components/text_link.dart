import 'package:flutter/material.dart';
import 'package:login_page_app/screens/redirect_screen.dart';

class TextLink extends StatelessWidget {
  final String textHandler;
  //const TextLink({Key? key}) : super(key: key);

  TextLink(this.textHandler);

  @override
  Widget build(BuildContext context) {
    // return Text(textHandler, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),);
    return GestureDetector(
      child: Text(
        textHandler,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      ),
      onTap: () =>  Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              RedirectScreen(textHandler)
        ),
      ),
    );
  }
}
