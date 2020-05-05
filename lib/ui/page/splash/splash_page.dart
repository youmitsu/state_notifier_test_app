import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_test_app/ui/page/pages.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with LocatorMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushNamed(WelcomePage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
