import 'package:flutter/material.dart';

class EmailSignInPage extends StatefulWidget {
  static const String routeName = '/signin';

  @override
  _EmailSignInPageState createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: Container(),
    );
  }
}
