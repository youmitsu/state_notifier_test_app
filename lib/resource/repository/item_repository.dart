import 'package:get_it/get_it.dart';
import 'package:state_notifier_test_app/collection/collection.dart';
import 'package:state_notifier_test_app/feature/firebase.dart';

class ItemRepository {
  final FireStoreProvider _fireStoreProvider;

  ItemRepository()
      : this._fireStoreProvider = GetIt.instance.get<FireStoreProvider>();

  Future<Item> addItem({String uid, Item item}) async {
    return await _fireStoreProvider.setItem(item);
  }
}
