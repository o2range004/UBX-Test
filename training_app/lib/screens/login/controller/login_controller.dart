


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:training_app/routes/route_list.dart';

class LoginController extends GetxController{
  var formKey = GlobalKey<FormState>();
  late bool isFormValid;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final TextInputFormatter alphabetsOnly =
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'));
  final TextInputFormatter singleLineFormatter =
      FilteringTextInputFormatter.deny('\n');
  final TextInputFormatter passwordFormatter =
      FilteringTextInputFormatter.deny(RegExp(r"[$&+,:;=?@#|'<>^]"));

  //RxBool isAHiddenField = true.obs;
  bool isAHiddenField = true;
  late RxBool isPasswordHidden;

  @override
  void onInit() {
    // TODO: implement onInit
    isPasswordHidden = true.obs;
    super.onInit();
  }

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

  void toggleShowPassword(){
    isPasswordHidden.value = !isPasswordHidden.value;
  }
  void doLogin() {
    //final isFormValid = formKey.currentState!.validate();
    //isFormValid = formKey.currentState!.validate();
    isFormValid = formKey.currentState?.validate() ?? false;
    if (isFormValid) {
      Get.offAndToNamed(RouteList.HOME, arguments: {"email" : emailController.text, "password" : passwordController.text});
    }else{
      print('login fail');  
    }
  }
}