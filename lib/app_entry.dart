import 'package:flutter/material.dart';

import 'ui/page/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case WelcomePage.routeName:
            return _buildPageRoute(WelcomePage());
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
