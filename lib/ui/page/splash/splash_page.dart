import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_test_app/ui/app/app_state.dart';

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
    context.read<AppStateNotifier>().authenticate();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashStateNotifier>(context, listen: false)
          .moveToFirstPage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
