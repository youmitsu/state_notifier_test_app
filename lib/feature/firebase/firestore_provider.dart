import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:state_notifier_test_app/collection/collection.dart';

class FireStoreProvider {
  Future<Item> setItem(Item entity) async {
    final json = entity.toJson();
    await Firestore.instance.collection('items').add(json);
    return entity;
  }
}
