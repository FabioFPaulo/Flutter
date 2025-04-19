import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/authenticate/register.dart';
import 'package:flutter_firebase/screens/authenticate/signin.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isRegisterForm = false;

  @override
  Widget build(BuildContext context) {
    if (isRegisterForm) {
      return Register(
        onLoginClick: () {
          setState(() {
            isRegisterForm = false;
          });
        },
      );
    } else {
      return SignIn(
        onRegisterClick: () {
          setState(() {
            isRegisterForm = true;
          });
        },
      );
    }
  }
}
