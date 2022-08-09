import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintTextHandler;
  final inputController;
  final String? Function(String? value) validateHandler;

  InputField(this.hintTextHandler, this.inputController,
      this.validateHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 28,
      ),
      child: TextFormField(
        controller: inputController,
        // validator: validatorHandler,
        validator: validateHandler,
        minLines: 1,
        decoration: InputDecoration(
          fillColor: const Color(0xFF1A1E1E),
          filled: true,
          hintText: hintTextHandler,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.only(top: 15, right: 20, bottom: 15, left: 20),
        ),
      ),
    );
  }
}
