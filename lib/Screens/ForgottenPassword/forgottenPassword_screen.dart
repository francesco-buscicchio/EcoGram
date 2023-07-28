import 'package:ecogram/Screens/ForgottenPassword/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class PasswordForgottenScreen extends StatefulWidget {
  const PasswordForgottenScreen({super.key});

  @override
  State<PasswordForgottenScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PasswordForgottenScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Body(),);
  }
}