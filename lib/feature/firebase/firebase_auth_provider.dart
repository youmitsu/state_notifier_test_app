import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

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
}
