import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_test_app/collection/item.dart';
import 'package:state_notifier_test_app/feature/firebase.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    Item item,
  }) = _RegisterState;
}

class RegisterStateNotifier extends StateNotifier<RegisterState> {
  final FireStoreProvider _fireStoreProvider;

  RegisterStateNotifier()
      : _fireStoreProvider = GetIt.instance.get<FireStoreProvider>(),
        super(const RegisterState());

  Future<void> register() async {
    await _fireStoreProvider.setItem(state.item);
  }
}
