import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier_test_app/ui/widget/submit_rounded_btn.dart';

import 'state/email_auth_state.dart';

class EmailAuthPage extends StatefulWidget {
  static const String routeName = '/signup';

  final PageController pageController;

  EmailAuthPage(this.pageController);

  @override
  _EmailAuthPageState createState() => _EmailAuthPageState();
}

class _EmailAuthPageState extends State<EmailAuthPage> {
  static const double verticalMargin = 50;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
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
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SubmitRoundedBtn(
                text: '登録する',
                onTap: () {
                  context.read<SignUpFormStateNotifier>().signUp();
//                  Navigator.of(context).pushNamed(SubmitLoadingPage.routeName);
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
}
