import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Tools/auth.dart';
import '../../../components/AlreadyHaveAnAccountCheck.dart';
import '../../../components/RoundedButton.dart';
import '../../../components/RoundedInputField.dart';
import '../../../components/RoundedPasswordField.dart';
import '../../Signup/components/background.dart';

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

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth()
          .createUserWithEmailAndPassword(
              email: _controllerEmail.text, password: _controllerPassword.text)
          .then((newUser) => {
                Auth().createCollection(collectionName: 'users', data: {
                  "id": newUser.user!.uid,
                  "createAt": DateTime.now(),
                  "email": _controllerEmail.text,
                  "name": "",
                  "phonenumber": "",
                  "surname": "",
                  "userImage": "",
                  "username": _controllerEmail.text
                      .substring(0, _controllerEmail.text.indexOf('@'))
                })
              });
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
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          _errorMessage(),
          const Text("SIGNUP", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset("assets/icons/signup.svg",
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
          RoundedButton(
            text: 'SIGNUP',
            press: createUserWithEmailAndPassword,
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
