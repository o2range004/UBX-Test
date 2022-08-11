import 'package:flutter/material.dart';

class IconKey extends StatelessWidget {
  final IconData iconKey;
  final VoidCallback onKeyHandler;
  final int flex;

  const IconKey({
    Key? key,
    required this.iconKey,
    required this.onKeyHandler,
    required this.flex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Material(
            child: InkWell(
              onTap:() => onKeyHandler.call(),
              child: Container(
                child: Center(
                  child: Icon(iconKey),
                ),
              ),
            ),
          ),
        ));
  }
}
