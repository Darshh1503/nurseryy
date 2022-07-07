import 'package:nurseryy/screens/login/components/cancel_button.dart';
import 'package:nurseryy/screens/login/components/login_form.dart';
import 'package:nurseryy/screens/login/components/register_form.dart';
import 'package:nurseryy/screens/login/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late Animation<double> containerSize;
  late AnimationController animationController;
  Duration animationDuration = Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    SystemChrome.setEnabledSystemUIOverlays([]);

    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize = Tween<double>(
            begin: size.height * 0.1, end: defaultRegisterSize)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 30,
              right: -90,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: kPrimaryColor),
              )),

          Positioned(
              top: -80,
              left: -100,
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: kPrimaryColor),
              )),
          Positioned(
              bottom: -10,
              right: -50,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(300),
                    color: kPrimaryColor),
              )),
          Positioned(
              bottom: -10,
              left: -50,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(300),
                    color: kPrimaryColor),
              )),
          //Cancel Button
          CancelButton(
            isLogin: isLogin,
            animationDuration: animationDuration,
            size: size,
            animationController: animationController,
            tapEvent: () {
              animationController.reverse();
              setState(() {
                isLogin = !isLogin;
              });
            },
          ),

          //Login Form
          LoginForm(size: size, defaultLoginSize: defaultLoginSize),

          //Register Container
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              if (viewInset == 0 && isLogin) {
                return buildRegisterContainer();
              } else if (!isLogin) {
                return buildRegisterContainer();
              }
              //returning empty container to hide the widget
              return Container();
            },
          ),
          //Register Form
          RegisterForm(
              isLogin: isLogin,
              animationDuration: animationDuration,
              size: size,
              defaultLoginSize: defaultLoginSize),
        ],
      ),
    );
  }

  Widget buildRegisterContainer() {
    var defaultRegisterSize;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            color: Colors.white),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: !isLogin
              ? null
              : () {
                  animationController.forward();
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
          child: isLogin
              ? Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )
              : null,
        ),
      ),
    );
  }
}
