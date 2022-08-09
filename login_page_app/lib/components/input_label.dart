import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  final String labelText;

  InputLabel(this.labelText);

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    );
  }
}
