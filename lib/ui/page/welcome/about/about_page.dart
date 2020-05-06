import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier_test_app/ui/widget/widget.dart';

class AboutPage extends StatelessWidget {
  static const double verticalMargin = 170;

  final PageController pageController;

  AboutPage(this.pageController);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).padding.top + verticalMargin,
              ),
              Text(
                'Posityへようこそ',
                style: Theme.of(context).textTheme.title.copyWith(
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '欲しいものを集めて\nシェアしよう',
                style: Theme.of(context).textTheme.subhead.copyWith(
                      color: Colors.white,
                      height: 1.3,
                      letterSpacing: 1.1,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SubmitRoundedBtn(
                text: 'メールアドレスで登録',
                onTap: () {
                  pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '登録ずみの方は',
                        style: Theme.of(context).textTheme.display4.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      TextSpan(
                        text: ' ログイン ',
                        style: Theme.of(context).textTheme.display4.copyWith(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            pageController.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear,
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
