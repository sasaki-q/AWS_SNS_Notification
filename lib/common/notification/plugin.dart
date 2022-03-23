import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin localPlugin = FlutterLocalNotificationsPlugin();

const InitializationSettings initSettings = InitializationSettings(
  iOS: IOSInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: true,
    requestAlertPermission: true,
  ),
);

const IOSNotificationDetails iOSPlatformSpecifics =
    IOSNotificationDetails(
        presentAlert: true,
        presentSound: true,
        presentBadge: true,
        badgeNumber: 1,
    );