import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page_app/components/input_field.dart';
import 'package:login_page_app/components/login_banner.dart';
import 'package:login_page_app/components/text_link.dart';

class LoginForm extends StatelessWidget {
  //const LoginForm({Key? key}) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback toggleShowPassword;
  final bool isPasswordHidden;
  final bool isaHiddenField = true;
  final TextInputFormatter alphabetsOnly =
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'));
  final TextInputFormatter singleLineFormatter =
      FilteringTextInputFormatter.deny('\n');
  final TextInputFormatter passwordFormatter =
      FilteringTextInputFormatter.deny(RegExp(r"[$&+,:;=?@#|'<>^]"));

  LoginForm(
    this.emailController,
    this.passwordController,
    this.toggleShowPassword,
    this.isPasswordHidden,
  );

  String? validateEmail(value) {
    const String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Invalid Email';
    } else {
      return null;
    }
  }

  String? validatePassword(value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return "This field is required";
    }
  }

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
                  labelText: "Your Email",
                  hintTextHandler: "Email Address",
                  inputController: emailController,
                  validateHandler: validateEmail,
                  inputFormatterHandler: [singleLineFormatter],
                  textxInputType: TextInputType.emailAddress,
                  isObscure: false,
                  isAHiddenField: !isaHiddenField,
                  isCursorshown: true,
                  isReadOnly: false,
                  maxLinesHandler: 1,
                ),
                InputField(
                  labelText: "Password",
                  hintTextHandler: "Password",
                  inputController: passwordController,
                  validateHandler: validatePassword,
                  inputFormatterHandler: [passwordFormatter],
                  textxInputType: TextInputType.text,
                  isObscure: isPasswordHidden,
                  isAHiddenField: isaHiddenField,
                  isCursorshown: true,
                  isReadOnly: false,
                  toggleShowPassword: toggleShowPassword,
                  maxLinesHandler: 1,
                ),
                
                const TextLink(textHandler: "Forgot Password?"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
