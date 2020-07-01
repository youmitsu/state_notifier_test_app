import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:state_notifier_test_app/collection/collection.dart';

class FireStoreProvider {
  Future<Item> setItem(Item entity) async {
    await Firestore.instance.collection('items').add(entity.toJson());
    return entity;
  }
}
