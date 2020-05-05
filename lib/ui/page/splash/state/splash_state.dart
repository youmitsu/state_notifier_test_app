import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_test_app/ui/page/pages.dart';

part 'splash_state.freezed.dart';

@freezed
abstract class SplashState with _$SplashState {
  factory SplashState() = _SplashState;
}

class SplashStateNotifier extends StateNotifier<SplashState> {
  SplashStateNotifier() : super(SplashState());

  Future<void> moveToFirstPage(BuildContext context) async {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushNamed(WelcomePage.routeName);
    });
  }
}
