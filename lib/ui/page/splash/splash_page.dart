import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier/state_notifier.dart';

import 'state/splash_state.dart';

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
      context.read<SplashStateNotifier>().moveToFirstPage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
