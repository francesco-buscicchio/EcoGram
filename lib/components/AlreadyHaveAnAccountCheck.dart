import 'package:ecogram/Screens/Login/login_screen.dart';
import 'package:ecogram/constants.dart';
import 'package:flutter/material.dart';

import '../Screens/Signup/signup_screen.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  const AlreadyHaveAnAccountCheck({Key? key, this.login = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an Account? " : 'Already Have an Account? ',
          style: const TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: () {
            login
                ? Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SingUpScreen();
                  }))
                : Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
          },
          child: Text(login ? 'Sign Up' : 'Sign In',
              style: const TextStyle(
                  color: kPrimaryColor, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
