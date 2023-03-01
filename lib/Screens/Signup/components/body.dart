import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/AlreadyHaveAnAccountCheck.dart';
import '../../../components/RoundedButton.dart';
import '../../../components/RoundedInputField.dart';
import '../../../components/RoundedPasswordField.dart';
import '../../Signup/components/background.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Text("SIGNUP", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset("assets/icons/signup.svg",
              height: size.height * 0.35),
          SizedBox(height: size.height * 0.03),
          RoundedInputField(
            icon: Icons.person,
            hintText: "Your Email",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            icon: Icons.password,
            hintText: "Password",
            onChanged: (value) {},
          ),
          RoundedButton(
            text: 'SIGNUP',
            press: () {},
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
