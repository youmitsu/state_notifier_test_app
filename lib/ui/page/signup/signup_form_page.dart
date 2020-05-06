import 'package:flutter/material.dart';
import 'package:state_notifier_test_app/ui/widget/submit_rounded_btn.dart';

class SignUpFormPage extends StatefulWidget {
  static const String routeName = '/signup';

  @override
  _SignUpFormPageState createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
  static const double verticalMargin = 150;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: verticalMargin + MediaQuery.of(context).padding.top,
          ),
          Text(
            'メールアドレスで登録',
            style: Theme.of(context).textTheme.headline.copyWith(
                  color: Colors.white,
                ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
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
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
