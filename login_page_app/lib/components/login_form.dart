import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page_app/components/input_field.dart';
import 'package:login_page_app/components/login_banner.dart';
import 'package:login_page_app/components/text_link.dart';

class LoginForm extends StatelessWidget {
  //const LoginForm({Key? key}) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? Function(String? value) validateEmail;
  final String? Function(String? value) validatePassword;
  final VoidCallback toggleShowPassword;
  final bool isPasswordHidden;
  final bool isaHiddenField = true;
  final TextInputFormatter alphabetsOnly = FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')); 
  final TextInputFormatter singleLineFormatter = FilteringTextInputFormatter.deny('\n');
  final TextInputFormatter passwordFormatter = FilteringTextInputFormatter.deny(RegExp(r"[$&+,:;=?@#|'<>^]"));


  
  LoginForm(
    this.emailController,
    this.passwordController,
    this.validateEmail,
    this.validatePassword,
    this.toggleShowPassword,
    this.isPasswordHidden,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 140),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LoginBanner(),
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField(
                  "Your Email",
                  "Email Address",
                  emailController,
                  validateEmail,
                  [singleLineFormatter],
                  false,
                  !isaHiddenField,
                ),
                InputField(
                  "Password",
                  "Password",
                  passwordController,
                  validatePassword,
                  [passwordFormatter],
                  isPasswordHidden,
                  isaHiddenField,
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
