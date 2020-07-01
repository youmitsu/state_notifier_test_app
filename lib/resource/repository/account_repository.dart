import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:state_notifier_test_app/collection/collection.dart';
import 'package:state_notifier_test_app/feature/firebase.dart';

class AccountRepository {
  final FirebaseAuthProvider authProvider;

  AccountRepository()
      : authProvider = GetIt.instance.get<FirebaseAuthProvider>();

  Future<AuthResult> signUpWithEmail(String email, String password) async {
    final result =
        await authProvider.signUpEmail(email: email, password: password);
    await _cacheAuthData(result);
    return result;
  }

  Future<AuthResult> signInWithEmail(String email, String password) async {
    final result =
        await authProvider.signInEmail(email: email, password: password);
    await _cacheAuthData(result);
    return result;
  }

  Future<bool> authorized() async {
    final result = await authProvider.authorized();
    return result;
  }

  Future<User> currentUser() async {
    return await authProvider.currentUser();
  }

  _cacheAuthData(AuthResult authResult) async {}
}
