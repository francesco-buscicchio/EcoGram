import 'package:ecogram/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProfileBackground extends StatelessWidget {
  const ProfileBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -50,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                height: size.height * 0.6,
                width: size.height * 0.6,
                decoration: BoxDecoration(border: Border.all(width: 1.0, color: kPrimaryColor), 
                borderRadius: BorderRadius.circular(152)),
              ),
            ),
          ),
          Positioned(
                top: -90, 
                child: Transform.rotate(
                angle: math.pi /4, 
                child: Container(
                height: size.height * 0.6,
                width: size.height * 0.6,
                decoration: BoxDecoration(border: Border.all(width: 1.0, color: kPrimaryColor), 
                borderRadius: BorderRadius.circular(152)),
                ),)
          ),
          Positioned(
            top: -130, 
            child: Transform.rotate(angle: math.pi / 4, child: Container(
            height: size.height * 0.6,
            width: size.height * 0.6,
            decoration: BoxDecoration(color: kPrimaryLightColor, borderRadius: BorderRadius.circular(152)),
          ))
          ),child
        ],
      )
    );
  }
}