import 'package:ecogram/Screens/Homepage/homepage.dart';
import 'package:ecogram/components/RoundedPasswordField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/AlreadyHaveAnAccountCheck.dart';
import '../../../components/RoundedButton.dart';
import '../components/background.dart';
import '../../../components/RoundedInputField.dart';
import '../../../Tools/auth.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm? $errorMessage');
  }

  Future<void> signInWithEmailAndPassword() async {
    errorMessage = '';
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>  HomePage()));
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          _errorMessage(),
          const Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset("assets/icons/login.svg",
              height: size.height * 0.35),
          SizedBox(height: size.height * 0.03),
          RoundedInputField(
            icon: Icons.person,
            hintText: "Your Email",
            onChanged: (value) {
              _controllerEmail.text = value;
            },
          ),
          RoundedPasswordField(
            icon: Icons.password,
            hintText: "Password",
            onChanged: (value) {
              _controllerPassword.text = value;
            },
          ),
          RoundedButton(text: 'Login', press: signInWithEmailAndPassword),
          SizedBox(height: size.height * 0.03),
          const AlreadyHaveAnAccountCheck()
        ]));
  }
}
