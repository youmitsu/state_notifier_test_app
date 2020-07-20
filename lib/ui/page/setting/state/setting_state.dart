import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_test_app/resource/repository.dart';

part 'setting_state.freezed.dart';

@freezed
abstract class SettingState with _$SettingState {
  const factory SettingState() = _SettingState;
}

class SettingStateNotifier extends StateNotifier<SettingState> {
  final AccountRepository _accountRepository;

  SettingStateNotifier()
      : _accountRepository = GetIt.instance.get<AccountRepository>(),
        super(const SettingState()) {}

  Future<bool> logout() async {
    return await _accountRepository.logout();
  }
}
