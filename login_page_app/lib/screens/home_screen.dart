import 'package:flutter/material.dart';
import 'package:login_page_app/constants.dart';
import 'package:login_page_app/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({Key? key}) : super(key: key);
  final String emailInput;
  final String passwordInput;

  HomeScreen(this.emailInput, this.passwordInput);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home Page",
          ),
        ),
        body: Container(
          width: double.infinity,
          height: 200,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Hi visitor!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Text(
                "Email: $emailInput",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Password: $passwordInput",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
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
        ));
  }
}
