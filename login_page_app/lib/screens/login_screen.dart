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
  late bool isPasswordHidden;

  @override
  void initState() {
    super.initState();
    isPasswordHidden = true;
  }

  void doLogin() {
    final isFormValid = formKey.currentState!.validate();
    if (isFormValid) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              emailInput: emailController.text,
              passwordInput: passwordController.text,
            ),
          ),
          (route) => false);
    }
  }

  toggleShowPassword() {
    setState(() {
      isPasswordHidden = !isPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoginForm(
                  emailController,
                  passwordController,
                  toggleShowPassword,
                  isPasswordHidden,
                ),
                Column(
                  children: [
                    const TextLink(textHandler: "I don't have an account"),
                    FormButton(
                        buttonText: "Login",
                        clickhandler: doLogin,
                        height: 60,
                        width: double.infinity),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
