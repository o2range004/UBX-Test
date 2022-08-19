import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:training_app/screens/home/controller/home_controller.dart';

import 'package:training_app/screens/login/controller/login_controller.dart';

void main() {
  late LoginController loginController;
  late HomeController homeController;
  WidgetsFlutterBinding.ensureInitialized(); 
  setUpAll(() {
    loginController = LoginController();
  });

  group("Invalid Input Fields", () {
    test("Invalid Email", () {
      String testEmailValue = 'mikaela@';
      var result = loginController.validateEmail(testEmailValue);
      expect(result, "Invalid Email");
    });

    test("Invalid Password", () {
      String testPasswordValue = '';
      String? result = loginController.validatePassword(testPasswordValue);
      expect(result, "This field is required");
    });

    tearDown(() {});
  });

  group("Valid Input Fields", () {
    String testEmailValue = 'mikaela@ux.ph';
    String testPasswordValue = 'Password123';
    //var formKey = GlobalKey<FormState>();
    test("Valid Email", () {
      String? result = loginController.validateEmail(testEmailValue);
      expect(result, null);
    });

    test("Valid Password", () {
      String? result = loginController.validatePassword(testPasswordValue);
      expect(result, null);
    });

    /*test("SAMPLE", () {
      
      loginController.emailController.text = testEmailValue;
      loginController.passwordController.text = testPasswordValue;
      loginController.doLogin();
      final homeController = HomeController();
    
      expect(homeController.email, testEmailValue);
      

    });*/
    tearDown(() {});
  });

  group("Show Password Bool", () {
    test("Get Init Value", () {
      //on init
      Get.put(loginController);
      expect(loginController.isPasswordHidden.value, true);
    });
    test("Toggle Show Password at init", () {
      Get.put(loginController);
      loginController.toggleShowPassword();
      expect(loginController.isPasswordHidden.value, false);
    });
    test("Toggle Show Password", () {
      RxBool testValue = false.obs;
      loginController.isPasswordHidden.value = testValue.value;
      loginController.toggleShowPassword();
      expect(loginController.isPasswordHidden.value, !testValue.value);
    });

  });
}
