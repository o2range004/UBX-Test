import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page_app/components/Keyboard/custom_keyboard.dart';
import 'package:login_page_app/components/form_button.dart';
import 'package:login_page_app/components/input_field.dart';
import 'package:login_page_app/constants.dart';
import 'package:login_page_app/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);
  final String emailInput;
  final String passwordInput;

  HomeScreen(this.emailInput, this.passwordInput);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isKeyboardShown = false;
  bool isKeyboardLowerCase = true;
  final textFieldController = TextEditingController();
  final TextInputFormatter singleLineFormatter =
      FilteringTextInputFormatter.deny('\n');
  late FocusNode messageFocusNode;
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
    messageFocusNode = FocusNode();
  }

  void toggleKeyboard() {
    messageFocusNode.requestFocus();
    setState(() {
      isKeyboardShown = !isKeyboardShown;
    });
    /*entry = OverlayEntry(
      builder: (context) => Positioned(
        left: 20,
        top: 40,
        child: CustomKeyboard(
            onTextInput: (myText) {
              insertTextMessage(myText);
            },
            onBackspace: backspace,
            onAddspace: addspace,
            onShift: toggleShift,
            onEnter: addNewline,
            isKeyboardLowerCase: isKeyboardLowerCase,
          ),
      ),
    );

    final overlay = Overlay.of(context)!;
    overlay.insert(entry!);*/
  }

  String? validateMessage(value) {
    if (value != null && value.length > 0) {
      return null;
    } else {
      return "Please type your message.";
    }
  }

  void insertTextMessage(String myText) {
    final text = textFieldController.text;
    final textSelection = textFieldController.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    textFieldController.text = newText;
    textFieldController.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void addspace() {
    final text = textFieldController.text;
    final textSelection = textFieldController.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      " ",
    );
    const myTextLength = 1;
    textFieldController.text = newText;
    textFieldController.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void backspace() {
    final text = textFieldController.text;
    final textSelection = textFieldController.selection;
    final selectionLength = textSelection.end - textSelection.start;
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      textFieldController.text = newText;
      textFieldController.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }
    // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    }
    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    textFieldController.text = newText;
    textFieldController.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  void addNewline() {
    final text = textFieldController.text;
    int cursorPos = textFieldController.selection.base.offset;
    final textSelection = textFieldController.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      "\n",
    );
    textFieldController.text = newText;
    textFieldController.selection =
        TextSelection.fromPosition(TextPosition(offset: cursorPos + 1));
  }

  void toggleShift() {
    setState(() {
      isKeyboardLowerCase = !isKeyboardLowerCase;
    });
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Home Page",
        ),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          ),
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        //width: double.infinity,
        padding: const EdgeInsets.all(20),
        //color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              //color: Colors.pink,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hi visitor!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Email: ${widget.emailInput}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Password: ${widget.passwordInput}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InputField(
                    labelText: "Message",
                    hintTextHandler: "Type here..",
                    inputController: textFieldController,
                    validateHandler: validateMessage,
                    textxInputType: TextInputType.none,
                    isObscure: false,
                    isAHiddenField: false,
                    isCursorshown: true,
                    isReadOnly: true,
                    maxLinesHandler: 5,
                    focusNodeHandler: messageFocusNode,
                    isEnabled: true,
                  ),
                ],
              ),
            ),
            
            
            Visibility(
              visible: isKeyboardShown,
              child: CustomKeyboard(
                onTextInput: (myText) {
                  insertTextMessage(myText);
                },
                onBackspace: backspace,
                onAddspace: addspace,
                onShift: toggleShift,
                onEnter: addNewline,
                isKeyboardLowerCase: isKeyboardLowerCase,
                computedWidth: (MediaQuery.of(context).size.width - 80)/10,
              ),
            ),
            FormButton("Toggle Keyboard", toggleKeyboard),
            
          ],
        ),
      ),
    );
  }
}
