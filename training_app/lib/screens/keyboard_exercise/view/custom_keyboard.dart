import 'package:flutter/material.dart';
import '../../../components/keyboard/icon_key.dart';
import '../../../components/keyboard/text_key.dart';

class CustomKeyboard extends StatelessWidget {
  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;
  final VoidCallback onAddspace;
  final VoidCallback onShift;
  final VoidCallback onEnter;
  final double computedWidth;
  const CustomKeyboard({
    Key? key,
    required this.onTextInput,
    required this.onBackspace,
    required this.onAddspace,
    required this.onShift,
    required this.onEnter,
    required this.isKeyboardLowerCase,
    required this.computedWidth,
  }) : super(key: key);

  static List<String> firstRowKeyList = [
    "q",
    "w",
    "e",
    "r",
    "t",
    "y",
    "u",
    "i",
    "o",
    "p"
  ];
  static List<String> secondRowKeyList = [
    "a",
    "s",
    "d",
    "f",
    "g",
    "h",
    "j",
    "k",
    "l"
  ];
  static List<String> thirdRowKeyList = ["z", "x", "c", "v", "b", "n", "m"];
  final bool isKeyboardLowerCase;

  /*void textInputHandler(String text) => onTextInput?.call(text);
  void backspaceHandler() => onBackspace.call();
  void addspaceHandler() => onAddspace.call();
  void shiftHandler() => onShift.call();
  void enterHAndler() => onEnter.call();*/

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      color: Color(0xFF252526),
      child: Column(
        children: [
          firstRowKeyboard(),
          secondRowKeyboard(),
          thirdRowKeyboard(),
          fourthRowKeyboard(),
        ],
      ),
    );
  }

  Expanded firstRowKeyboard() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...firstRowKeyList.map((text) {
            return TextKey(
              keyText: text,
              //onTextInput: textInputHandler,
              onTextInput: onTextInput,
              setLowerCase: isKeyboardLowerCase,
              computedWidth: computedWidth,
            );
          }),
        ],
      ),
    );
  }

  Expanded secondRowKeyboard() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...secondRowKeyList.map((text) {
            return TextKey(
              keyText: text,
              onTextInput: onTextInput,
              setLowerCase: isKeyboardLowerCase,
              computedWidth: computedWidth,
            );
          }),
        ],
      ),
    );
  }

  Expanded thirdRowKeyboard() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconKey(
              iconKey: Icons.arrow_upward, onKeyHandler: onShift, flex: 1),
          ...thirdRowKeyList.map((text) {
            return TextKey(
              keyText: text,
              onTextInput: onTextInput,
              setLowerCase: isKeyboardLowerCase,
              computedWidth: computedWidth,
            );
          }),
          IconKey(
              iconKey: Icons.backspace, onKeyHandler: onBackspace, flex: 1)
        ],
      ),
    );
  }

  Expanded fourthRowKeyboard() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconKey(
              iconKey: Icons.numbers, onKeyHandler: onAddspace, flex: 1),
          IconKey(
            iconKey: Icons.sentiment_satisfied_alt,
            onKeyHandler: onAddspace,
            flex: 1,
          ),
          IconKey(
              iconKey: Icons.space_bar, onKeyHandler: onAddspace, flex: 4),
          TextKey(
            keyText: ".",
            onTextInput: onTextInput,
            setLowerCase: isKeyboardLowerCase,
            computedWidth: computedWidth,
          ),
          IconKey(
            iconKey: Icons.keyboard_return,
            onKeyHandler: onEnter,
            flex: 1,
          )
        ],
      ),
    );
  }
}
