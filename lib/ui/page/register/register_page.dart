import 'package:flutter/material.dart';
import 'package:state_notifier_test_app/config/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier_test_app/ui/page/register/state/register_state.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
    context.read<RegisterStateNotifier>().initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('欲しいものを追加'),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _RegisterBtn(),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegisterBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<RegisterStateNotifier>().register();
      },
      child: Container(
        height: 50,
        color: ButtonColor.orange,
        alignment: Alignment.center,
        child: Text(
          '追加する',
          style: Theme.of(context).textTheme.display3.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
