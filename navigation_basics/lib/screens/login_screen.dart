import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_basics/navigation/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Login"),
          ElevatedButton(
            onPressed: () => context.push(Routes.home.fullRoute),
            child: const Text('Signin'),
          ),
        ],
      ),
    );
  }
}
