import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:state_notifier_test_app/feature/firebase.dart';

class AccountRepository {
  final FirebaseAuthProvider authProvider;

  AccountRepository()
      : authProvider = GetIt.instance.get<FirebaseAuthProvider>();

  Future<AuthResult> signUpWithEmail(String email, String password) async {
    return await authProvider.signUpEmail(email: email, password: password);
  }
}
