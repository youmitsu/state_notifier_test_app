import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier_test_app/config/app_colors.dart';
import 'package:state_notifier_test_app/ui/page/register/state/register_state.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

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
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 14.0),
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  autovalidate: true,
                  onChanged: () {
                    Form.of(context).save();
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        style: Theme.of(context).textTheme.display3,
                        decoration: const InputDecoration(
                          hintText: 'カバン',
                          labelText: '名前',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: Theme.of(context).textTheme.display3,
                        decoration: const InputDecoration(
                          hintText: 'https://amazon.com/1234',
                          labelText: 'URL',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
