import 'package:nurseryy/screens/login/constants.dart';
import 'package:nurseryy/components/input_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({
    Key? key,
    required this.hint
  }) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        cursorColor: kPrimaryColor,
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(Icons.lock, color: kPrimaryColor),
            hintText: hint,
            border: InputBorder.none),
      ),
    );
  }
}
