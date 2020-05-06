import 'package:flutter/material.dart';
import 'package:state_notifier_test_app/ui/widget/submit_rounded_btn.dart';

class SignUpFormPage extends StatefulWidget {
  static const String routeName = '/signup';

  final PageController pageController;

  SignUpFormPage(this.pageController);

  @override
  _SignUpFormPageState createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
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
          title: Text('メールアドレスで登録'),
          backgroundColor: Colors.transparent,
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
                onTap: () {},
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
