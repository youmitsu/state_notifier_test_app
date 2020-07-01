import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:state_notifier_test_app/collection/collection.dart';

class FirebaseAuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AuthResult> signUpEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result;
    } catch (e) {
      // TODO: ErrorHandling
      return e;
    }
  }

  Future<AuthResult> signInEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result;
    } catch (e) {
      // TODO: ErrorHandling
      return e;
    }
  }

  Future<bool> authorized() async {
    return await _auth.currentUser() != null;
  }

  Future<User> currentUser() async {
    final currentUser = await _auth.currentUser();
    return User.fromDto(currentUser);
  }
}
