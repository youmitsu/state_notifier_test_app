import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class User {
  @Default('')
  String uid;
  @Default('')
  String email;

  User.fromDto(FirebaseUser firebaseUser)
      : this.uid = firebaseUser.uid,
        this.email = firebaseUser.email;
}
