import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'signup_form_state.freezed.dart';

@freezed
abstract class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState() = _SignUpFormState;
}

class SignUpFormStateNotifier extends StateNotifier<SignUpFormState> {
  SignUpFormStateNotifier() : super(const SignUpFormState()) {}
}
