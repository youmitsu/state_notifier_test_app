import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/welcome';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/welcome_image1.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 170,
                ),
                Text(
                  'Posityへようこそ',
                  style: Theme.of(context).textTheme.title.copyWith(
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '欲しいものを集めて\nシェアしよう',
                  style: Theme.of(context).textTheme.subhead.copyWith(
                        color: Colors.white,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 260,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.orange,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'メールアドレスで登録',
                          style: Theme.of(context).textTheme.subhead.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ),
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
                          style: Theme.of(context).textTheme.subhead.copyWith(
                                color: Colors.white,
                              ),
                        ),
                        TextSpan(
                          text: 'ログイン',
                          style: Theme.of(context).textTheme.subhead.copyWith(
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
    );
  }
}
