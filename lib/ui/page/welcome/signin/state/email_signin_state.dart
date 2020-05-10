import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'email_signin_state.freezed.dart';

@freezed
abstract class EmailSignInState with _$EmailSignInState {
  const factory EmailSignInState() = _EmailSignInState;
}

class EmailSignInStateNotifier extends StateNotifier<EmailSignInState> {
  EmailSignInStateNotifier() : super(const EmailSignInState()) {}
}
