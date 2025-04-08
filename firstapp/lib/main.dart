import 'package:firstapp/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sandbox"),
        backgroundColor: Colors.grey,
      ),

      body: Row(
        children: [
          Container(height: 100, color: Colors.red, child: const Text("Red")),
          Container(
            height: 200,
            color: Colors.green,
            child: const Text("Green"),
          ),
          Container(height: 300, color: Colors.blue, child: const Text("Blue")),
        ],
      ),
    );
  }
}
