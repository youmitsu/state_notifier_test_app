import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier_test_app/config/app_colors.dart';
import 'package:state_notifier_test_app/ui/widget/widget.dart';

import '../state.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register';

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    context.read<RegisterStateNotifier>().initState();
    return Scaffold(
      appBar: AppBar(
        title: Text('欲しいものを追加'),
      ),
      body: _RegisterBody(),
    );
  }
}

class _RegisterBody extends StatelessWidget {
  static const titleFormAttr = 'title';
  static const urlFormAttr = 'url';

  final _formKey = GlobalKey<FormBuilderState>();

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
              child: FormBuilder(
                key: _formKey,
                initialValue: {
                  titleFormAttr: '',
                  urlFormAttr: '',
                },
                autovalidate: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FormBuilderTextField(
                      attribute: titleFormAttr,
                      style: Theme.of(context).textTheme.display3,
                      decoration: const InputDecoration(
                        hintText: 'カバン',
                        labelText: '名前',
                      ),
                      validators: [
                        FormBuilderValidators.required(errorText: '入力してください'),
                      ],
                      autovalidate: true,
                      onChanged: (value) {
                        context.read<RegisterStateNotifier>().setName(value);
                      },
                      maxLines: 1,
                    ),
                    FormBuilderTextField(
                      attribute: urlFormAttr,
                      style: Theme.of(context).textTheme.display3,
                      decoration: const InputDecoration(
                        hintText: 'https://amazon.com/1234',
                        labelText: 'URL',
                      ),
                      validators: [
                        FormBuilderValidators.url(
                            errorText: 'メールアドレスの形式で入力してください'),
                      ],
                      autovalidate: true,
                      onChanged: (value) {
                        context.read<RegisterStateNotifier>().setUrl(value);
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
            child: _RegisterBtn(
              onPressed: () {
                if (_formKey.currentState.saveAndValidate()) {
                  context.read<RegisterStateNotifier>().register();
                }
              },
            ),
          ),
          Positioned.fill(
            child: context.watch<RegisterState>().isLoading
                ? CommonLoadingWidget()
                : Container(),
          ),
        ],
      ),
    );
  }
}

class _RegisterBtn extends StatelessWidget {
  final VoidCallback onPressed;

  _RegisterBtn({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: ButtonColor.orange,
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onPressed();
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            child: Text(
              '追加する',
              style: Theme.of(context).textTheme.display3.copyWith(
                    backgroundColor: Colors.transparent,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
