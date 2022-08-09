import 'package:flutter/material.dart';
import 'package:login_page_app/components/input_field.dart';
import 'package:login_page_app/components/input_field_obscure.dart';
import 'package:login_page_app/components/input_label.dart';
import 'package:login_page_app/components/login_banner.dart';
import 'package:login_page_app/components/text_link.dart';

class LoginForm extends StatelessWidget {
  //const LoginForm({Key? key}) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? Function(String? value) validateEmail;
  final String? Function(String? value) validatePassword;
  final bool isPasswordHidden;
  final VoidCallback toggleShowPassword;

  LoginForm(
    this.emailController,
    this.passwordController,
    this.validateEmail,
    this.validatePassword,
    this.isPasswordHidden,
    this.toggleShowPassword,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 160),
      child: Column(
        children: [
          const LoginBanner(),
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputLabel("YOUR EMAIL"),
                InputField(
                  "Email Address",
                  emailController,
                  validateEmail,
                ),
                InputLabel("PASSWORD"),
                InputFieldObscure(
                  "Password",
                  passwordController,
                  validatePassword,
                  isPasswordHidden,
                  toggleShowPassword,
                ),
                TextLink("Forgot Password?"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
