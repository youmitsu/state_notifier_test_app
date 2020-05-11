import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier_test_app/config/app_colors.dart';
import 'package:state_notifier_test_app/ui/widget/submit_rounded_btn.dart';

import 'state/email_signup_state.dart';

class EmailSignUpPage extends StatefulWidget {
  static const String routeName = '/signup';

  final PageController pageController;

  EmailSignUpPage(this.pageController);

  @override
  _EmailSignUpPageState createState() => _EmailSignUpPageState();
}

class _EmailSignUpPageState extends State<EmailSignUpPage> {
  static const double verticalMargin = 50;

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
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        widget.pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('メールアドレスで登録'),
          backgroundColor: Colors.transparent,
          leading: BackButton(),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                    context.read<EmailSignUpStateNotifier>().updateEmail(value);
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
                        .read<EmailSignUpStateNotifier>()
                        .updatePassword(value);
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SubmitRoundedBtn(
                text: '登録する',
                onTap: () {
                  context.read<EmailSignUpStateNotifier>().signUp();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ' 利用規約 ',
                        style: Theme.of(context).textTheme.display4.copyWith(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                      TextSpan(
                        text: 'に同意の上、ご利用ください',
                        style: Theme.of(context).textTheme.display4.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
