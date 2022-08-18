import 'package:flutter/material.dart';

class TextKey extends StatelessWidget {
  final String keyText;
  final ValueSetter<String> onTextInput;
  final bool setLowerCase;
  final double computedWidth;

  const TextKey({
    Key? key,
    required this.keyText,
    required this.onTextInput,
    required this.setLowerCase,
    required this.computedWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2, left: 1, right: 1),
      child: Material(
        child: setLowerCase
            ? InkWell(
                onTap: () => onTextInput.call(keyText),
                child: textContainer(keyText),
              )
            : InkWell(
                onTap: () => onTextInput.call(keyText.toUpperCase()),
                child: textContainer(keyText.toUpperCase()),
              ),
      ),
    );
  }

  Container textContainer(text) {
    return Container(
      width: computedWidth,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
    );
  }
}
