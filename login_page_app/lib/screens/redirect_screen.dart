import 'package:flutter/material.dart';
import 'package:login_page_app/constants.dart';
import 'package:login_page_app/screens/login_screen.dart';

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
        child: Column(
          children: [
            Text("Redirect from `$textHandler`"),
            const Spacer(),
            TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                ),
                child: const Text(
                  'Back to Login',
                  style: TextStyle(color: buttonPrimaryColor),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
