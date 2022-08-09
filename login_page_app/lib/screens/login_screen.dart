import 'package:flutter/material.dart';
import 'package:login_page_app/components/form_button.dart';
import 'package:login_page_app/components/login_form.dart';
import 'package:login_page_app/components/text_link.dart';
import 'package:login_page_app/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late String emailInput;
  late String passwordInput;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isPasswordHidden = true;


  void doLogin() {
    final isFormValid = formKey.currentState!.validate();
    if (isFormValid) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              HomeScreen(emailController.text, passwordController.text),
        ),
      );
    }
  }

  String? validateEmail(value) {
    if (value != null && value.isNotEmpty && value.contains("@")) {
      return null;
    } else {
      return "Invalid Email";
    }
  }

  String? validatePassword(value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return "This field is required";
    }
  }

  void toggleShowPassword() {
    setState(() {
      isPasswordHidden = !isPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_background_img.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LoginForm(
                emailController,
                passwordController,
                validateEmail,
                validatePassword,
                isPasswordHidden,
                toggleShowPassword,
              ),
              Column(
                children: [
                  TextLink("I don't have an account"),
                  FormButton("Login", doLogin),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
