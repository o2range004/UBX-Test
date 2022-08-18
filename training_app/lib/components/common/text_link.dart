import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  final String textHandler;

  const TextLink({Key? key, required this.textHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        textHandler,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      ),
      onTap: () => print('clicked....'),
      /*onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => RedirectScreen(
            textHandler: textHandler,
          ),
        ),
      ),*/
    );
  }
}
