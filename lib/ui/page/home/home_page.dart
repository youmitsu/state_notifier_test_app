import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier_test_app/collection/collection.dart';
import 'package:state_notifier_test_app/ui/page/pages.dart';
import 'package:state_notifier_test_app/ui/page/state.dart';

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
      body: HomeBody(),
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

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uid = context.watch<AppState>().uid;
    return Container(
      margin: const EdgeInsets.all(8),
      child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('items')
              .document(uid)
              .collection('data')
              .snapshots(),
          builder: (context, snapshot) {
            Logger()..d(snapshot.data.documents.first.data);
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                final data = snapshot.data.documents[index].data;
                return ItemCard(
                  Item.fromJson(data),
                );
              },
            );
          }),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;

  ItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(item.title),
            Text(item.url ?? ''),
          ],
        ),
      ),
    );
  }
}
