import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_test_app/resource/repository.dart';
import 'package:state_notifier_test_app/ui/page/pages.dart';

part 'email_signin_state.freezed.dart';

@freezed
abstract class EmailSignInState with _$EmailSignInState {
  const factory EmailSignInState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isLoading,
  }) = _EmailSignInState;
}

class EmailSignInStateNotifier extends StateNotifier<EmailSignInState> {
  final AccountRepository _accountRepository;

  EmailSignInStateNotifier()
      : _accountRepository = GetIt.instance.get<AccountRepository>(),
        super(const EmailSignInState());

  updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  signIn(BuildContext context) async {
    final email = state.email;
    final password = state.password;
    state = state.copyWith(isLoading: true);
    try {
      await _accountRepository.signInWithEmail(email, password);
      state = state.copyWith(isLoading: false);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomePage.routeName, (_) => false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      // TODO: ErrorHandling
    }
  }
}
