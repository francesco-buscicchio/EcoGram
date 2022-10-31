import 'package:ecogram/constants.dart';
import 'package:flutter/material.dart';
import 'package:ecogram/Screens/Welcome/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/RoundedButton.dart';
import '../../Login/login_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Welcome to EcoGram",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset("assets/icons/chat.svg",
                height: size.height * 0.45),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
                text: "LOGIN",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                }),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
              color: kPrimaryLightColor,
              textColor: Colors.black,
            )
          ]),
    ));
  }
}
