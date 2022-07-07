import 'package:flutter/material.dart';
import 'package:nurseryy/components/rounded_button.dart';
import 'package:nurseryy/components/rounded_input.dart';
import 'package:nurseryy/components/rounded_password_input.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration * 5,
      child: Visibility(
        visible: !isLogin,
        child: Align(
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
                    "Hello!!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 40),
                  // ignore: unnecessary_new
                  new Image.asset(
                    'assets/images/mainlogo.png',
                    height: 180,
                  ),
                  SizedBox(height: 30),
                  RoundedInput(icon: Icons.mail, hint: 'Username'),
                  RoundedInput(icon: Icons.face_rounded, hint: 'Name'),
                  RoundedPasswordInput(hint: 'Password'),
                  SizedBox(height: 10),
                  RoundedButton(title: 'SIGN UP')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
