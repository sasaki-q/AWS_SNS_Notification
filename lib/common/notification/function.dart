import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification/common/global_context.dart';
import 'package:notification/common/notification/plugin.dart';

Future<void> showMyNotification() async {
  await localPlugin.initialize(
    initSettings,
    onSelectNotification: pushPage,
  );
  localPlugin.show(
    100, 
    "local notification title", 
    "local notification body", 
    const NotificationDetails(),
    payload: "/next"
  );
}

void pushPage(String? payload) {
  Navigator.of(globalCtx).pushNamed(payload!);
}