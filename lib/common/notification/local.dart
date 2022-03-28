import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification/common/global_context.dart';
import 'package:notification/common/notification/plugin.dart';

Future<void> showMyNotification({
  required String title,
  required String message,
  required int badgeNum,
  required String path,
}) async {
  await localPlugin.initialize(
    initSettings,
    onSelectNotification: pushPage,
  );
  localPlugin.show(
    100, 
    title, 
    message, 
    NotificationDetails(
      iOS: IOSNotificationDetails(
        presentAlert: true,
        presentSound: true,
        presentBadge: true,
        badgeNumber: badgeNum,
      ),
    ),
    payload: path,
  );
}

void pushPage(String? payload) {
  FlutterAppBadger.removeBadge();
  Navigator.of(globalCtx).pushNamed("/${payload!}");
}