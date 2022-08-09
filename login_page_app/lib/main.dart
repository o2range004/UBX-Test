import 'package:flutter/material.dart';
import './screens/login_screen.dart';


void main() => runApp(LoginPageApp());

class LoginPageApp extends StatefulWidget {
  const LoginPageApp({Key? key}) : super(key: key);

  @override
  State<LoginPageApp> createState() => _LoginPageAppState();
}

class _LoginPageAppState extends State<LoginPageApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page App",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}