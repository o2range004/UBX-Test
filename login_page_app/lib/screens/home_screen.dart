import 'package:flutter/material.dart';
import 'package:login_page_app/components/form_button.dart';
import 'package:login_page_app/screens/login_screen.dart';
import 'package:login_page_app/screens/search_myanimelist_screen.dart';
import 'package:login_page_app/screens/toggle_keyboard_screen.dart';

class HomeScreen extends StatefulWidget {
  final String emailInput;
  final String passwordInput;

  const HomeScreen(
      {Key? key, required this.emailInput, required this.passwordInput})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  void navigateNextPage(context, page){
    Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => page));
                      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Home Page",
        ),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          ),
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hi visitor!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Email: ${widget.emailInput}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Password: ${widget.passwordInput}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  FormButton(
                      buttonText: "Go to Keyboard Exercise",
                      clickhandler: ()=> navigateNextPage(context, const ToggleKeyboardScreen()),
                      height: 40,
                      width: double.infinity),
                FormButton(buttonText: "Go to Next Exercise", clickhandler: ()=> navigateNextPage(context, const SearchMyanimelistScreen()), height: 40, width: double.infinity),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
