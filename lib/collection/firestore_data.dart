import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'item.dart';

class FireStoreData {
  final Stream<QuerySnapshot> raw;

  final Stream<List<Item>> snapshots;

  FireStoreData({@required this.raw})
      : snapshots = raw.transform<List<Item>>(
          StreamTransformer.fromHandlers(
            handleData: (data, sink) {
              sink.add(
                data.documents.map(
                  (v) {
                    return Item.fromJson(v.data);
                  },
                ),
              );
            },
          ),
        );
}
