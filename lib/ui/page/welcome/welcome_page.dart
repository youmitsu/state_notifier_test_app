import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_notifier_test_app/ui/page/pages.dart';
import 'package:state_notifier_test_app/ui/widget/submit_rounded_btn.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/welcome';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  static const double verticalMargin = 170;

  final backgroundImages = [
    'images/welcome_image1.jpg',
    'images/welcome_image2.jpg',
    'images/welcome_image3.jpg',
  ];

  int imageIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (_) {
      setState(() {
        if (imageIndex == backgroundImages.length - 1) {
          imageIndex = 0;
        } else if (imageIndex < backgroundImages.length - 1) {
          imageIndex++;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        child: Container(
          key: ValueKey<String>(backgroundImages[imageIndex]),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black45,
            backgroundBlendMode: BlendMode.darken,
            image: DecorationImage(
              image: AssetImage(backgroundImages[imageIndex]),
              fit: BoxFit.fitHeight,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            ),
          ),
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
                      Navigator.of(context).pushNamed(SignUpFormPage.routeName);
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
                            style:
                                Theme.of(context).textTheme.display4.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          TextSpan(
                            text: ' ログイン ',
                            style:
                                Theme.of(context).textTheme.display4.copyWith(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
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
        ),
      ),
    );
  }
}
