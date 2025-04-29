import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anonym
  Future<MyUser?> signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();

      if (userCredential.user == null) {
        return null;
      } else {
        return MyUser.toModel(userCredential.user!);
      }
    } catch (e) {
      return null;
    }
  }

  //  auth change user stream
  Stream<MyUser?> get user => _auth.authStateChanges().map(
    (User? user) => user != null ? MyUser.toModel(user) : null,
  );

  // sign in with email and password
  Future<MyUser?> signinEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return MyUser.toModel(userCredential.user!);
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  // register with email and password
  Future<MyUser?> registerEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        final user = MyUser.toModel(userCredential.user!);
        await DatabaseService(
          uid: user.uid,
        ).updateUserData('0', 'new crew member', 100);
        return user;
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  // sign out
  Future<void> signOut() async {
    _auth.signOut();
  }
}
