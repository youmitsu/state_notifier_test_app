import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:state_notifier_test_app/config/app_themes.dart';
import 'package:state_notifier_test_app/navigation/nav_type.dart';
import 'package:state_notifier_test_app/ui/page/splash/state/splash_state.dart';
import 'package:state_notifier_test_app/ui/page/welcome/loading/submit_loading_page.dart';
import 'package:state_notifier_test_app/ui/page/welcome/state/welcome_state.dart';

import 'ui/page/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: WelcomeTheme().lightTheme,
      darkTheme: WelcomeTheme().darkTheme,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case SplashPage.routeName:
            return _buildPageRoute(
              StateNotifierProvider<SplashStateNotifier, SplashState>(
                child: SplashPage(),
                create: (_) => SplashStateNotifier(),
              ),
              navType: NavType.fade,
            );
          case WelcomePage.routeName:
            return _buildPageRoute(
              StateNotifierProvider<WelcomeStateNotifier, WelcomeState>(
                child: WelcomePage(),
                create: (_) => WelcomeStateNotifier(),
              ),
            );
          case SubmitLoadingPage.routeName:
            return _buildPageRoute(
              SubmitLoadingPage(),
              navType: NavType.fade,
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

  Route _buildPageRoute(Widget page, {NavType navType = NavType.unknown}) {
    return CustomPageRouteBuilder.buildPageRoute(navType, page);
  }
}
