import 'package:flutter/material.dart';

class LoginBanner extends StatelessWidget {
  const LoginBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 108,
      padding: const EdgeInsets.only(left: 30, right: 30, top: 23, bottom: 23),
      color: const Color(0xFF121515),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Login",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          Text(
            "Sign to your account",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
