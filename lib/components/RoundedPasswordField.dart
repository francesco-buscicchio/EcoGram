import 'package:ecogram/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'TextFielContainer.dart';

class RoundedPasswordField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  bool obscureTextBool = true;

  RoundedPasswordField({
    Key? key,
    obscureTextBool = true,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
          onChanged: widget.onChanged,
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
              icon: Icon(
                widget.icon,
                color: kPrimaryColor,
              ),
              hintText: widget.hintText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.obscureTextBool = !widget.obscureTextBool;
                  });
                },
                child: Icon(
                    widget.obscureTextBool
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: kPrimaryColor),
              )),
          obscureText: widget.obscureTextBool),
    );
  }
}
