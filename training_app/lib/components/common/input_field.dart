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
  final inputFormatterHandler;
  final TextInputType textxInputType;
  final bool isCursorshown;
  final bool isReadOnly;
  final FocusNode? focusNodeHandler;
  final int? maxLinesHandler;
  final bool? isEnabled;

  const InputField({
    Key? key,
    required this.labelText,
    required this.hintTextHandler,
    required this.inputController, 
    required this.validateHandler,
     this.inputFormatterHandler,
     required this.textxInputType,
     required this.isObscure,
     required this.isAHiddenField,
     required this.isCursorshown,
     required this.isReadOnly,
     this.focusNodeHandler,
     this.toggleShowPassword,
     this.maxLinesHandler,
     this.isEnabled,
  }) : super(key: key);


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
            maxLines: maxLinesHandler,
            obscureText: isObscure,
            showCursor: isCursorshown,
            readOnly: isReadOnly,
            focusNode: focusNodeHandler,
            enabled: isEnabled,
            decoration: InputDecoration(
              fillColor: const Color(0xFF1A1E1E),
              filled: true,
              hintText: hintTextHandler,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(
                  top: 15, right: 20, bottom: 15, left: 20),
              suffixIcon: isAHiddenField
                  ? GestureDetector(
                      
                      onTap: toggleShowPassword,
                      child: isObscure
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.white,
                              size: 21,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.white,
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
