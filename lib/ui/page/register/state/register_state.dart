import 'package:bot_toast/bot_toast.dart';
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
    String uid,
    String name,
    String url,
    @Default(false) bool isLoading,
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
        uid: _user.uid,
      );
    });
  }

  Future<Item> register() async {
    state = state.copyWith(
      isLoading: true,
    );
    Item result;
    try {
      result = await _itemRepository.addItem(
          item: Item(
        uid: state.uid,
        title: state.name,
        url: state.url,
        createdAt: DateTime.now(),
      ));
      BotToast.showText(text: '欲しいものを追加しました');
    } catch (e) {
      // error-handling
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
    return result;
  }

  void setName(String value) {
    state = state.copyWith(
      name: value,
    );
  }

  void setUrl(String value) {
    state = state.copyWith(
      url: value,
    );
  }
}
