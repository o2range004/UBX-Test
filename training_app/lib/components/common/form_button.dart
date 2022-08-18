import 'package:flutter/material.dart';
import '../../constants.dart';

class FormButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback clickhandler;
  final double height;
  final double width;

  const FormButton({
    Key? key,
    required this.buttonText,
    required this.clickhandler,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(top: 27),
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonPrimaryColor,
        ),
        onPressed: clickhandler,
        child: Text(buttonText),
      ),
    );
  }
}
