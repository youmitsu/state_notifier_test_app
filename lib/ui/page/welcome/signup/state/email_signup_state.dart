import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_test_app/resource/repository.dart';
import 'package:state_notifier_test_app/ui/page/home/home_page.dart';

part 'email_signup_state.freezed.dart';

@freezed
abstract class EmailSignUpState with _$EmailSignUpState {
  const factory EmailSignUpState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isLoading,
  }) = _EmailSignUpState;
}

class EmailSignUpStateNotifier extends StateNotifier<EmailSignUpState> {
  final AccountRepository _accountRepository;

  EmailSignUpStateNotifier()
      : _accountRepository = GetIt.instance.get<AccountRepository>(),
        super(const EmailSignUpState());

  updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  signUp(BuildContext context) async {
    final email = state.email;
    final password = state.password;
    state = state.copyWith(isLoading: true);
    try {
      await _accountRepository.signUpWithEmail(email, password);
      state = state.copyWith(isLoading: false);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomePage.routeName, (_) => false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      // TODO: ErrorHandling
    }
  }
}
