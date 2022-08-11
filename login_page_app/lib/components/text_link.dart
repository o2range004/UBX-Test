import 'package:flutter/material.dart';
import 'package:login_page_app/screens/redirect_screen.dart';
class TextLink extends StatelessWidget {
  final String textHandler;

  TextLink(this.textHandler,);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        textHandler,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => RedirectScreen(textHandler)),
      ),
    );
  }
}
