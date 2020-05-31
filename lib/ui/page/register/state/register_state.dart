import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState() = _RegisterState;
}

class RegisterStateNotifier extends StateNotifier<RegisterState> {
  RegisterStateNotifier() : super(const RegisterState()) {}
}
