import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:training_app/components/common/form_button.dart';
import 'package:training_app/components/common/input_field.dart';
import 'package:training_app/components/common/text_link.dart';
import 'package:training_app/screens/login/controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  static String name = "login";

  //const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: controller.formKey,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_background_img.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loginBanner(),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputField(
                        labelText: "Your email",
                        hintTextHandler: "Emai Address",
                        inputController: controller.emailController,
                        inputFormatterHandler: [controller.singleLineFormatter],
                        validateHandler: controller.validateEmail,
                        textxInputType: TextInputType.emailAddress,
                        isObscure: false,
                        isAHiddenField: !controller.isAHiddenField.value,
                        isCursorshown: true,
                        isReadOnly: false,
                        maxLinesHandler: 1,
                      ),
                      Obx(() => InputField(
                            labelText: "Password",
                            hintTextHandler: "Password",
                            inputController: controller.passwordController,
                            validateHandler: controller.validatePassword,
                            inputFormatterHandler: [
                              controller.passwordFormatter
                            ],
                            textxInputType: TextInputType.text,
                            isObscure: controller.isPasswordHidden.value,
                            isAHiddenField: controller.isAHiddenField.value,
                            //isAHiddenField: false,
                            isCursorshown: true,
                            isReadOnly: false,
                            toggleShowPassword: controller.toggleShowPassword,
                            maxLinesHandler: 1,
                          )),
                      const TextLink(textHandler: "Forgot Password?")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomSheet: 
      
        FormButton(
          buttonText: "Login",
          clickhandler: controller.doLogin,
          height: 60,
          width: double.infinity,
        ),
      ),
    );
  }
}

Container loginBanner() {
  return Container(
    width: double.infinity,
    height: 100,
    padding: const EdgeInsets.only(left: 30, right: 30, top: 23, bottom: 23),
    color: const Color(0xFF121515),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Login",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        Text(
          "Sign to your account",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ],
    ),
  );
}


