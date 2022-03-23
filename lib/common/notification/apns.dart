import 'package:flutter/material.dart';
import 'package:flutter_apns/flutter_apns.dart';
import 'package:notification/common/notification/local.dart';

final PushConnector connector = createPushConnector();

void initAPNs() {
  connector.token.addListener(() {
      debugPrint('DEBUG Device Token === ${connector.token.value}');
  });

  connector.configure(
    onMessage: _onMessage,
    onResume: _onResume,
    onLaunch: _onLaunch,
    onBackgroundMessage: _onBackgroundMessage,
  );
}

Future<void> _onMessage(RemoteMessage? message) async {
  if(message != null && message.notification != null) {
    showMyNotification(title: message.notification!.title!);
  }
}

Future<void> _onResume(RemoteMessage? message) async {
  if(message != null && message.notification != null) {
    pushPage(message.notification!.title!);
  }
}

Future<void> _onLaunch(RemoteMessage? message) async {
  if(message != null && message.notification != null) {
    debugPrint("DEBUG on launch === ${message.notification?.title}");
  }
}

Future<void> _onBackgroundMessage(RemoteMessage? message) async {}

