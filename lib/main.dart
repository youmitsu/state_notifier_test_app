import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:state_notifier_test_app/feature/firebase.dart';
import 'package:state_notifier_test_app/resource/repository.dart';

import 'ui/app/app_entry.dart';

void main() {
  setupLocator();
  runApp(App());
}

void setupLocator() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<FirebaseAuthProvider>(FirebaseAuthProvider());
  getIt.registerSingleton<AccountRepository>(AccountRepository());
}
