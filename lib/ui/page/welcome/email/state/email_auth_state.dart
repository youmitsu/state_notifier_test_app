import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'email_auth_state.freezed.dart';

@freezed
abstract class EmailAuthState with _$EmailAuthState {
  const factory EmailAuthState() = _EmailAuthState;
}

class SignUpFormStateNotifier extends StateNotifier<EmailAuthState> {
  SignUpFormStateNotifier() : super(const EmailAuthState()) {}
}
