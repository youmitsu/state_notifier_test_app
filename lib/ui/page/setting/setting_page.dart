import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier_test_app/ui/page/pages.dart';
import 'package:state_notifier_test_app/ui/page/setting/state/setting_state.dart';

class SettingPage extends StatefulWidget {
  static const String routeName = '/setting';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: _SettingBody(),
    );
  }
}

class _SettingBody extends StatelessWidget {
  final List<Widget> items = [
    _LogoutItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return items[index];
          },
          separatorBuilder: (context, index) {
            return Divider(
              indent: 5,
              endIndent: 5,
            );
          },
          itemCount: items.length),
    );
  }
}

class _LogoutItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'ログアウト',
        style: Theme.of(context).textTheme.display1,
      ),
      onTap: () async {
        final result = await showOkCancelAlertDialog(
          context: context,
          title: 'ログアウト',
          message: 'ログアウトします。よろしいですか？',
        );
        if (result == OkCancelResult.ok) {
          await context.read<SettingStateNotifier>().logout();
          Navigator.of(context)
              .pushNamedAndRemoveUntil(SplashPage.routeName, (route) => false);
        }
      },
    );
  }
}
