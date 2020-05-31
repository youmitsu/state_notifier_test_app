import 'package:flutter/material.dart';
import 'package:state_notifier_test_app/ui/page/pages.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('欲しいもの'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            tooltip: '設定',
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(RegisterPage.routeName);
        },
      ),
    );
  }
}
