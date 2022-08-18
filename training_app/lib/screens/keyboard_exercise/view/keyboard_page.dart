import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:training_app/screens/keyboard_exercise/controller/keyboard_controller.dart';

import '../../../components/common/form_button.dart';
import '../../../components/common/input_field.dart';
import 'custom_keyboard.dart';

class KeyboardPage extends GetView<KeyboardController> {
  const KeyboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text(
        "Keyboard Exercise",
      )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputField(
              labelText: "Message",
              hintTextHandler: "Type here..",
              inputController: controller.textFieldController,
              validateHandler: controller.validateMessage,
              textxInputType: TextInputType.none,
              isObscure: false,
              isAHiddenField: false,
              isCursorshown: true,
              isReadOnly: true,
              maxLinesHandler: 5,
              focusNodeHandler: controller.messageFocusNode,
              isEnabled: true,
            ),
            Obx(
              () => Visibility(
                visible: controller.isKeyboardShown.value,
                child: CustomKeyboard(
                  onTextInput: (myText) {
                    controller.insertTextMessage(myText);
                  },
                  onBackspace: controller.backspace,
                  onAddspace: controller.addspace,
                  onShift: controller.toggleShift,
                  onEnter: controller.addNewline,
                  isKeyboardLowerCase: controller.isKeyboardLowerCase.value,
                  computedWidth: (MediaQuery.of(context).size.width - 80) / 10,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: FormButton(
                buttonText: "Toggle Keyboard",
                clickhandler: controller.toggleKeyboard,
                height: 40,
                width: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
