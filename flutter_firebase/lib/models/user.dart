import 'package:firebase_auth/firebase_auth.dart';

class MyUser {
  final String uid;

  MyUser({required this.uid});

  static MyUser toModel(User user) {
    return MyUser(uid: user.uid);
  }
}
