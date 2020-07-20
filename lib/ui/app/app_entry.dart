import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:state_notifier_test_app/config/app_themes.dart';
import 'package:state_notifier_test_app/navigation/nav_type.dart';
import 'package:state_notifier_test_app/ui/app/app_state.dart';

import '../page/pages.dart';
import '../page/state.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<AppStateNotifier, AppState>(
      create: (_) => AppStateNotifier(),
      child: MaterialApp(
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case SplashPage.routeName:
              return _buildPageRoute(
                context,
                page: StateNotifierProvider<SplashStateNotifier, SplashState>(
                  child: SplashPage(),
                  create: (_) => SplashStateNotifier(),
                ),
                theme: BaseTheme(),
                navType: NavType.fade,
              );
            case WelcomePage.routeName:
              return _buildPageRoute(
                context,
                page: StateNotifierProvider<WelcomeStateNotifier, WelcomeState>(
                  child: WelcomePage(),
                  create: (_) => WelcomeStateNotifier(),
                ),
                theme: WelcomeTheme(),
              );
            case EmailSignInPage.routeName:
              return _buildPageRoute(
                context,
                page: StateNotifierProvider<EmailSignInStateNotifier,
                    EmailSignInState>(
                  child: EmailSignInPage(),
                  create: (_) => EmailSignInStateNotifier(),
                ),
                theme: WelcomeTheme(),
                navType: NavType.fade,
              );
            case HomePage.routeName:
              return _buildPageRoute(
                context,
                page: HomePage(),
                theme: HomeTheme(),
                navType: NavType.unknown,
              );
            case RegisterPage.routeName:
              return _buildPageRoute(
                context,
                page:
                    StateNotifierProvider<RegisterStateNotifier, RegisterState>(
                  child: RegisterPage(),
                  create: (_) => RegisterStateNotifier(),
                ),
                theme: HomeTheme(),
                navType: NavType.slide,
              );
            case SettingPage.routeName:
              return _buildPageRoute(
                context,
                page: StateNotifierProvider<SettingStateNotifier, SettingState>(
                  child: SettingPage(),
                  create: (_) => SettingStateNotifier(),
                ),
                theme: HomeTheme(),
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
      ),
    );
  }

  Route _buildPageRoute(
    BuildContext context, {
    @required Widget page,
    @required AppTheme theme,
    NavType navType = NavType.unknown,
  }) {
    return CustomPageRouteBuilder.buildPageRoute(
      navType,
      Theme(
        data: Theme.of(context).brightness == Brightness.dark
            ? theme.darkTheme
            : theme.lightTheme,
        child: page,
      ),
    );
  }
}
