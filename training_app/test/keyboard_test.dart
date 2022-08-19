import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:training_app/screens/keyboard_exercise/controller/keyboard_controller.dart';

void main() {
  late KeyboardController keyboardController;

  setUpAll(() {
    keyboardController = KeyboardController();
  });

  group("Toggle Keyboard", () {
    
    test("Toggle Keyboard at init", () {
      Get.put(keyboardController);
      expect(keyboardController.isKeyboardShown.value, false);
    });
    
    test("do Toggle Keyboard", () {
      RxBool testValue = true.obs;
      keyboardController.isKeyboardShown.value = testValue.value;
      keyboardController.toggleKeyboard();
      expect(keyboardController.isKeyboardShown.value, !testValue.value);
    });
  });

  group("Key tests",() {
    test("Insert Text", () {
      String testValue = "A";
      String currentText = keyboardController.textFieldController.text;
      keyboardController.insertTextMessage(testValue);
      String matcherValue = currentText+testValue;
      expect(keyboardController.textFieldController.text, matcherValue);
    });

    test("Add Space", () {
      String testValue = " ";
      String currentText = keyboardController.textFieldController.text;
      keyboardController.addspace();
      String matcherValue = currentText+testValue;
      expect(keyboardController.textFieldController.text, matcherValue);
    });
    test("Back Space", () {
      String currentText = keyboardController.textFieldController.text;
      keyboardController.backspace();
      String matcherValue = currentText.substring(0, currentText.length - 1);
      expect(keyboardController.textFieldController.text, matcherValue);
    });
    test("Add New Line", () {
      String currentText = keyboardController.textFieldController.text;
      keyboardController.addNewline();
      expect(keyboardController.textFieldController.text, "${currentText}\n");
    });
  });
}
