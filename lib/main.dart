import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification/app.dart';
import 'package:notification/common/notification/function.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initMyNotification();
  runApp(
    const ProviderScope(
      child: App(
        key: Key("App"),
      ),
    ),
  );
}

