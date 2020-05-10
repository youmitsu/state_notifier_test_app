import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_test_app/resource/repository.dart';

part 'email_auth_state.freezed.dart';

@freezed
abstract class EmailAuthState with _$EmailAuthState {
  const factory EmailAuthState({
    @Default('') String email,
    @Default('') String password,
  }) = _EmailAuthState;
}

class SignUpFormStateNotifier extends StateNotifier<EmailAuthState> {
  final AccountRepository _accountRepository;

  SignUpFormStateNotifier()
      : _accountRepository = GetIt.instance.get<AccountRepository>(),
        super(const EmailAuthState());

  signUp() async {
    final email = state.email;
    final password = state.password;
    try {
      final result = await _accountRepository.signUpWithEmail(email, password);
    } catch (e) {
      // TODO: ErrorHandling
    }
  }
}
