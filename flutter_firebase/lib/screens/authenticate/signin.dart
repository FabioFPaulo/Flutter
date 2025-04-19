import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:flutter_firebase/shared/constants.dart';
import 'package:flutter_firebase/shared/loading.dart';

class SignIn extends StatefulWidget {
  final void Function() onRegisterClick;

  const SignIn({super.key, required this.onRegisterClick});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = "";
  String password = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
          backgroundColor: Colors.brown[100],
          appBar: AppBar(
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            title: Text("Sign in to Brew Crew"),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: "Email"),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                      hintText: "Password",
                    ),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  FilledButton(
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      await _auth.signinEmailPassword(email, password);
                      setState(() {
                        loading = false;
                      });
                    },
                    child: Text("Login"),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      widget.onRegisterClick();
                    },
                    child: Text("Don't have an account? Register here"),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
