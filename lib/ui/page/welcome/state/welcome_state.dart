import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'welcome_state.freezed.dart';

@freezed
abstract class WelcomeState with _$WelcomeState {
  const factory WelcomeState() = _WelcomeState;
}

class WelcomeStateNotifier extends StateNotifier<WelcomeState> {
  WelcomeStateNotifier() : super(const WelcomeState()) {}
}
