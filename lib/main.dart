import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification/app.dart';
import 'package:notification/common/notification/apns.dart';
import 'package:notification/common/notification/local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initMyLocalNotification();
  initAPNs();
  runApp(
    const ProviderScope(
      child: App(
        key: Key("App"),
      ),
    ),
  );
}

