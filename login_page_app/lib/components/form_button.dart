import 'package:flutter/material.dart';
import 'package:login_page_app/constants.dart';

class FormButton extends StatelessWidget {
  //const FormButton{Key? key}) : super(key: key);
  final String buttonText;
  final VoidCallback clickhandler;

  FormButton(this.buttonText, this.clickhandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 27),
      width: double.infinity,
      height: 60,
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
