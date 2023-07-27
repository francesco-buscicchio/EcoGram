import 'package:flutter/material.dart';

import '../Screens/ForgottenPassword/forgottenPassword_screen.dart';
import '../Screens/Signup/signup_screen.dart';

class PasswordForgotten extends StatelessWidget {
  const PasswordForgotten({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[        
        GestureDetector(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const PasswordForgottenScreen();
          }));
        }, child: const Text('Password Forgotten?'),)],
    );
  }
}