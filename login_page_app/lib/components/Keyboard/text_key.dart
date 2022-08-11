import 'package:flutter/material.dart';
import 'package:login_page_app/constants.dart';

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
    //remove Expanded wrapper
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2, left: 1, right: 1),
      child: Material(
        //color: Colors.transparent,
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
      // constraints: BoxConstraints(maxWidth: 30),
      //color: Colors.grey,
      /*decoration: BoxDecoration(
        //color: const Color.fromARGB(255, 223, 222, 222),
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(-1, 0),
          )
        ],
      ),*/
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
    );
  }
}
