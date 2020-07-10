import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier_test_app/config/app_colors.dart';
import 'package:state_notifier_test_app/ui/widget/widget.dart';

import '../../state.dart';

class EmailSignInPage extends StatefulWidget {
  static const String routeName = '/signin';

  @override
  _EmailSignInPageState createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  FocusNode _emailFocus;
  FocusNode _passwordFocus;

  @override
  void initState() {
    super.initState();
    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
        leading: CloseButton(),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: <Widget>[
                Container(
                  height: 56,
                  width: 300,
                  padding: const EdgeInsets.only(left: 18),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.9),
                  ),
                  child: TextFormField(
                    autofocus: true,
                    focusNode: _emailFocus,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      _emailFocus.unfocus();
                      FocusScope.of(context).requestFocus(_passwordFocus);
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: Theme.of(context).textTheme.display3.copyWith(
                          color: TextColor.black,
                        ),
                    decoration: InputDecoration.collapsed(hintText: 'メールアドレス'),
                    onChanged: (value) {
                      context
                          .read<EmailSignInStateNotifier>()
                          .updateEmail(value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 56,
                  width: 300,
                  padding: const EdgeInsets.only(left: 18),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.9),
                  ),
                  child: TextFormField(
                    focusNode: _passwordFocus,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      _passwordFocus.unfocus();
                    },
                    keyboardType: TextInputType.visiblePassword,
                    style: Theme.of(context).textTheme.display3.copyWith(
                          color: TextColor.black,
                        ),
                    decoration: InputDecoration.collapsed(hintText: 'パスワード'),
                    obscureText: true,
                    onChanged: (value) {
                      context
                          .read<EmailSignInStateNotifier>()
                          .updatePassword(value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SubmitRoundedBtn(
                  text: 'ログイン',
                  onTap: () {
                    context.read<EmailSignInStateNotifier>().signIn(context);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Visibility(
            visible: context.watch<EmailSignInState>().isLoading,
            child: Positioned.fill(
              child: CommonLoadingWidget(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
  }
}
