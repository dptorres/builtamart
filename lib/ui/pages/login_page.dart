
import 'package:flutter/material.dart';

import '../widgets/buttons/builtamart_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void showErrorDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Cannot have empty field'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
        )
    );
  }

  void handleLoginPress() {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      showErrorDialog();
    } else {
      // navigator push to gallery screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/images/logo_gallery.png',
                  width: 80,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Enter a valid username'
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter your password'
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: BuiltaMartButton(
                    onPressed: () => handleLoginPress(),
                    label: 'Login',
                    fontColor: Colors.white,
                    btnFontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
      ),
    );
  }

}