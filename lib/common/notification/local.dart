import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification/common/global_context.dart';
import 'package:notification/common/notification/plugin.dart';

Future<void> initMyLocalNotification() async {
  NotificationAppLaunchDetails? details = await localPlugin.getNotificationAppLaunchDetails();
  debugPrint("DEBUG local notification init === $details");
  if(details != null) {
    if(details.payload != null) {
      debugPrint("DEBUG local notification init === ${details.payload}");
      Navigator.of(globalCtx).pushNamed("${details.payload}");
    }
  }
}

Future<void> showMyNotification({
  required String title,
}) async {
  await localPlugin.initialize(
    initSettings,
    onSelectNotification: pushPage,
  );
  localPlugin.show(
    100, 
    title, 
    "local notification body", 
    const NotificationDetails(
      iOS: iOSPlatformSpecifics,
    ),
    payload: "/next"
  );
}

void pushPage(String? payload) {
  print("DEBUG push page payload: $payload");
  Navigator.of(globalCtx).pushNamed(payload!);
}