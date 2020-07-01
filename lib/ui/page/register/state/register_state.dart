import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_test_app/collection/item.dart';
import 'package:state_notifier_test_app/resource/repository.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    Item item,
  }) = _RegisterState;
}

class RegisterStateNotifier extends StateNotifier<RegisterState> {
  final ItemRepository _itemRepository;
  final AccountRepository _accountRepository;

  RegisterStateNotifier()
      : _itemRepository = GetIt.instance.get<ItemRepository>(),
        _accountRepository = GetIt.instance.get<AccountRepository>(),
        super(const RegisterState());

  initState() {
    _accountRepository.currentUser().then((_user) {
      state = state.copyWith(
        item: Item(uid: _user.uid, title: 'hoge', url: 'https://google.com'),
      );
    });
  }

  Future<void> register() async {
    final item = await _itemRepository.postItem(item: state.item);
  }
}
