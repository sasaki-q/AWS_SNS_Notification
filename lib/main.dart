import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notification/app.dart';
import 'package:notification/common/notification/apns.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("box");
  initAPNs();
  runApp(
    const ProviderScope(
      child: App(
        key: Key("App"),
      ),
    ),
  );
}

