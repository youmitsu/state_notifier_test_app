import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
            onPressed: () {
              Navigator.of(context).pushNamed(SettingPage.routeName);
            },
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
              .orderBy("createdAt", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data.documents.isEmpty) {
              return Center(
                child: Text(
                  '欲しいものを追加しよう',
                  style: Theme.of(context).textTheme.subhead,
                ),
              );
            }
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            // no-op
          },
          child: Container(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Text(item.title),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Text(item.url ?? ''),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Text(item.displayCreatedAt),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
