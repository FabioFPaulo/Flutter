import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:flutter_firebase/shared/constants.dart';
import 'package:flutter_firebase/shared/loading.dart';

class Register extends StatefulWidget {
  final void Function() onLoginClick;

  const Register({super.key, required this.onLoginClick});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

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
            title: Text("Sign up to Brew Crew"),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: "Email"),
                    validator: (val) => val!.isEmpty ? "Enter an email" : null,
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
                    validator:
                        (val) =>
                            val!.length < 6
                                ? "Enter a password 6+ chars long"
                                : null,
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
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        await _auth.registerEmailPassword(email, password);
                        setState(() {
                          loading = false;
                        });
                      }
                    },
                    child: Text("Register"),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      widget.onLoginClick();
                    },
                    child: Text("Have an account? Signin here"),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
