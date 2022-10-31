import 'package:ecogram/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/background.dart';
import '../../../components/RoundedInputField.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          const Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset("assets/icons/login.svg",
              height: size.height * 0.35),
          RoundedInputField(
            icon: Icons.person,
            hintText: "Your Email",
            onChanged: (value) {},
          )
        ]));
  }
}
