import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/AlreadyHaveAnAccountCheck.dart';
import '../../../components/RoundedButton.dart';
import '../../../components/messages/errorMessage.dart';
import '../components/background.dart';
import '../../../components/RoundedInputField.dart';
import '../../../Tools/auth.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _controllerEmail = TextEditingController();

  Future<void> passwordReset() async {
    try {
      await Auth().passwordReset(email: _controllerEmail.text);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: ErrorMessage(error: e),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Text("FORGOTTEN PASSWORD",
              style: TextStyle(fontWeight: FontWeight.bold)),
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
          RoundedButton(
            text: 'Recover Password',
            press: passwordReset,
          ),
          SizedBox(height: size.height * 0.03),
          const AlreadyHaveAnAccountCheck(
            login: false,
          )
        ],
      ),
    );
  }
}

