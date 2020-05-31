import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:state_notifier_test_app/collection/collection.dart';

class FireStoreProvider {
  final Firestore _firestore = Firestore.instance;

  Future<void> setItem(Item entity) async {
    await _firestore.collection('items').document().setData(entity.toJson());
  }
}
