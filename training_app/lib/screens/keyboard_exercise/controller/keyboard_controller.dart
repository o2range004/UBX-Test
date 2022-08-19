import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class KeyboardController extends GetxController {
  final textFieldController = TextEditingController();
  late FocusNode messageFocusNode = FocusNode();
  //RxBool isKeyboardShown = false.obs;
  late RxBool isKeyboardShown;
  RxBool isKeyboardLowerCase = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    isKeyboardShown = false.obs;
    super.onInit();
  }

  void toggleKeyboard() {
    isKeyboardShown.value = !isKeyboardShown.value;
  }

  String? validateMessage(value) {
    if (value != null && value.length > 0) {
      return null;
    } else {
      return "Please type your message.";
    }
  }

  void insertTextMessage(String myText) {
    textFieldController.text = textFieldController.text + myText;
  }

  void addspace() {
    textFieldController.text = "${textFieldController.text} ";
  }

  void backspace() {
    final text = textFieldController.text;
    if (text != null && text.length > 0) {
      textFieldController.text = text.substring(0, text.length - 1);
    }
  }

  void addNewline() {
    textFieldController.text = "${textFieldController.text}\n";
  }


  void toggleShift() {
    isKeyboardLowerCase.value = !isKeyboardLowerCase.value;
  }
}
