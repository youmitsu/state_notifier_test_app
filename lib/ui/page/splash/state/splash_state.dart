import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_test_app/resource/repository.dart';
import 'package:state_notifier_test_app/ui/page/pages.dart';

import '../../state.dart';

part 'splash_state.freezed.dart';

@freezed
abstract class SplashState with _$SplashState {
  factory SplashState() = _SplashState;
}

class SplashStateNotifier extends StateNotifier<SplashState> with LocatorMixin {
  final AccountRepository _accountRepository;
  final AppStateNotifier _appStateNotifier;

  SplashStateNotifier({AppStateNotifier appStateNotifier})
      : _accountRepository = GetIt.instance.get<AccountRepository>(),
        _appStateNotifier = appStateNotifier,
        super(SplashState());

  Future<void> moveToFirstPage(BuildContext context) async {
    final user = await _accountRepository.currentUser();
    if (user == null) {
      Navigator.of(context).pushReplacementNamed(WelcomePage.routeName);
    } else {
      _appStateNotifier.setUid(user.uid);
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    }
  }
}
