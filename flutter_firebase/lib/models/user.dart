import 'package:firebase_auth/firebase_auth.dart';

class MyUser {
  final String uid;

  MyUser({required this.uid});

  static MyUser toModel(User user) {
    return MyUser(uid: user.uid);
  }
}

class UserData {
  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData({
    required this.uid,
    required this.name,
    required this.sugars,
    required this.strength,
  });
}
