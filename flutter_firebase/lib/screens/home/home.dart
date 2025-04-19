import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Bew Crew"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () async {
              await _auth.signOut();
            },
            child: Text("logout"),
          ),
        ],
      ),
    );
  }
}
