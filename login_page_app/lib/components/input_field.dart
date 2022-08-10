import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final String hintTextHandler;
  final inputController;
  final String? Function(String? value) validateHandler;

  final bool isObscure;
  final bool isAHiddenField;
  final VoidCallback? toggleShowPassword;
  var inputFormatterHandler;
  final TextInputType textxInputType;

  InputField(
      this.labelText,
      this.hintTextHandler,
      this.inputController,
      this.validateHandler,
      this.inputFormatterHandler,
      this.textxInputType,
      this.isObscure,
      this.isAHiddenField,
      [this.toggleShowPassword]);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Text(
              labelText.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextFormField(
            controller: inputController,
            validator: validateHandler,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: inputFormatterHandler,
            keyboardType: textxInputType,
            minLines: 1,
            obscureText: isObscure,
            decoration: InputDecoration(
              fillColor: const Color(0xFF1A1E1E),
              filled: true,
              hintText: hintTextHandler,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(
                  top: 15, right: 20, bottom: 15, left: 20),
              suffix: isAHiddenField
                  ? GestureDetector(
                      onTap: toggleShowPassword,
                      child: isObscure
                          ? const Icon(
                              Icons.visibility,
                              size: 21,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              size: 21,
                            ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
