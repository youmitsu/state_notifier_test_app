import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_test_app/feature/firebase.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({String uid}) = _AppState;
}

class AppStateNotifier extends StateNotifier<AppState> {
  final FirebaseAuthProvider _firebaseAuthProvider;

  AppStateNotifier()
      : this._firebaseAuthProvider = GetIt.instance.get<FirebaseAuthProvider>(),
        super(const AppState()) {}

  authenticate() async {
    final user = await _firebaseAuthProvider.currentUser();
    state = state.copyWith(uid: user.uid);
  }
}
