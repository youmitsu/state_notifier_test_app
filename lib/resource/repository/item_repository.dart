import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:state_notifier_test_app/collection/collection.dart';
import 'package:state_notifier_test_app/feature/firebase.dart';

class ItemRepository {
  final FireStoreProvider _fireStoreProvider;
  final FirebaseAuthProvider _firebaseAuthProvider;

  ItemRepository()
      : this._fireStoreProvider = GetIt.instance.get<FireStoreProvider>(),
        this._firebaseAuthProvider = GetIt.instance.get<FirebaseAuthProvider>();

  Future<Item> addItem({String uid, Item item}) async {
    return await _fireStoreProvider.setItem(item);
  }

  Future<Stream<QuerySnapshot>> fetchAll() async {
    final uid = (await _firebaseAuthProvider.currentUser()).uid;
    final rawItems = _fireStoreProvider.fetchItems(uid);
    return rawItems;
  }
}
