import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier_test_app/config/app_colors.dart';
import 'package:state_notifier_test_app/ui/page/register/state/register_state.dart';

final registerStateNotifier =
    StateNotifierProvider<RegisterStateNotifier, RegisterState>(
  (ref) => RegisterStateNotifier(),
);

class RegisterPage extends HookWidget {
  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    useProvider(registerStateNotifier).initState();
    return Scaffold(
      appBar: AppBar(
        title: Text('欲しいものを追加'),
      ),
      body: _RegisterBody(),
    );
  }
}

class _RegisterBody extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          return '名前を入力してください';
                        }
                        return null;
                      },
                      autovalidate: true,
                      onChanged: (value) {
                        registerStateNotifier.read(context).setName(value);
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
                          return 'URLを入力してください';
                        }
                        return null;
                      },
                      autovalidate: true,
                      onChanged: (value) {
                        registerStateNotifier.read(context).setUrl(value);
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
    );
  }
}

class _RegisterBtn extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Form.of(context).validate()) {
          registerStateNotifier.read(context).register();
        }
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
