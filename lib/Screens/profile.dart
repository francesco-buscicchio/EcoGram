import 'package:ecogram/components/backgrounds/ProfileBackground.dart';
import 'package:ecogram/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Profiles extends StatefulWidget {
  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    return const Text('Profiles');
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: math.pi / 4,
                  child: Container(
                      width: 140,
                      height: 140,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(35))),
                ),
                ClipPath(
                  clipper: ProfileImageClipper(),
                  child: Image.asset(
                    "../assets/images/user_default.png",
                    width: 180,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            Text("Francesco Buscicchio",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 14)),
            const SizedBox(
              height: 4.0,
            ),
            Text("@francesco_buscicchio",
                style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 80),
                Row(children: const [
                  Text("Posts"),
                  Text("30")
                ],)
          ],
        ),
      ),
    ));
  }
}

class ProfileImageClipper extends CustomClipper<Path> {
  double radius = 35;

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width / 2 - radius, radius)
      ..quadraticBezierTo(size.width / 2, 0, size.width / 2 + radius, radius)
      ..lineTo(size.width - radius, size.height / 2 - radius)
      ..quadraticBezierTo(size.width, size.height / 2, size.width - radius,
          size.height / 2 + radius)
      ..lineTo(size.width / 2 + radius, size.height - radius)
      ..quadraticBezierTo(size.width / 2, size.height, size.width / 2 - radius,
          size.height - radius)
      ..lineTo(radius, size.height / 2 + radius)
      ..quadraticBezierTo(0, size.height / 2, radius, size.height / 2 - radius)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
