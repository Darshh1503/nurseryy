import 'package:flutter/material.dart';
import 'package:nurseryy/components/rounded_button.dart';
import 'package:nurseryy/components/rounded_input.dart';
import 'package:nurseryy/components/rounded_password_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final Size size;
  final double defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: defaultLoginSize,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
              SizedBox(height: 40),
              new Image.asset(
                'assets/images/mainlogo.png',
                height: 180,
              ),
              SizedBox(height: 40),
              RoundedInput(icon: Icons.mail, hint: 'Username'),
              RoundedPasswordInput(hint: 'Password'),
              SizedBox(height: 10),
              RoundedButton(title: 'LOGIN')
            ],
          ),
        ),
      ),
    );
  }
}
