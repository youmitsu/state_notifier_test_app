import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:state_notifier_test_app/collection/collection.dart';

class FireStoreProvider {
  Future<Item> setItem(Item entity) async {
    await Firestore.instance
        .collection('items')
        .document(entity.uid)
        .collection('data')
        .add(entity.toJson());
    return entity;
  }

  Stream<QuerySnapshot> fetchItems(String uid) {
    return Firestore.instance
        .collection('items')
        .document(uid)
        .collection('data')
        .snapshots();
  }
}
