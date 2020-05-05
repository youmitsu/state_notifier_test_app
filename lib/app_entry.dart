import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:state_notifier_test_app/ui/page/splash/state/splash_state.dart';
import 'package:state_notifier_test_app/ui/page/welcome/state/welcome_state.dart';

import 'ui/page/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StateNotifierProvider<SplashStateNotifier, SplashState>(
        child: SplashPage(),
        create: (context) => SplashStateNotifier(),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case WelcomePage.routeName:
            return _buildPageRoute(
              StateNotifierProvider<WelcomeStateNotifier, WelcomeState>(
                child: WelcomePage(),
                create: (context) => WelcomeStateNotifier(),
              ),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => Center(
                child: Text('Unknown page route.'),
              ),
            );
        }
      },
    );
  }

  Route _buildPageRoute(Widget page) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}
