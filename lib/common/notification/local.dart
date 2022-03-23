import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification/common/global_context.dart';
import 'package:notification/common/notification/plugin.dart';

// Future<void> initMyLocalNotification() async {
//   NotificationAppLaunchDetails? details = await localPlugin.getNotificationAppLaunchDetails();
//   if(details != null && details.payload != null) {
//     debugPrint("DEBUG local notification init === ${details.payload}");
//     Navigator.of(globalCtx).pushNamed("${details.payload}");
//   }
// }

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
  Navigator.of(globalCtx).pushNamed(payload!);
}