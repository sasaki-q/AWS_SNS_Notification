import 'package:flutter/material.dart';
import 'package:flutter_apns/flutter_apns.dart';
import 'package:hive/hive.dart';
import 'package:notification/common/notification/local.dart';

final PushConnector connector = createPushConnector();

Future<void> initAPNs() async {
  final Box box = Hive.box("box");
  connector.token.addListener(() {
      debugPrint('DEBUG Device Token === ${connector.token.value}');
  });

  Future<void> _onMessage(RemoteMessage? message) async {
    if(message != null && message.notification != null) {
      final data = message.data;
      final contents = message.notification!;
      showMyNotification(
        title: contents.title!,
        message: contents.body!,
        badgeNum: data["badge"],
        path: data["path"],
      );
    }
  }

  Future<void> _onResume(RemoteMessage? message) async {
    if(message != null && message.notification != null) {
      pushPage(message.data["path"]);
    }
  }

  Future<void> _onLaunch(RemoteMessage? message) async {
    if(message != null && message.notification != null) {
      box.put("path", message.data["path"]);
    }
  }

  Future<void> _onBackgroundMessage(RemoteMessage? message) async {}
  
  connector.configure(
    onMessage: _onMessage,
    onResume: _onResume,
    onLaunch: _onLaunch,
    onBackgroundMessage: _onBackgroundMessage,
  );
}

/*
  {
    "APNS_SANDBOX":"{\"aps\":{\"alert\":{\"title\":\"My notification\", \"body\":\"next\"},\"badge\":100},\"path\":\"next\",\"badge\":100}"
  }
*/

/*
  {
    "APNS_SANDBOX":"{
      \"aps\":{
        \"alert\":
          {\"title\":\"My notification\", \"body\":\"next\"}, 
        \"badge\":100
      },
      \"path\":\"next\",
      \"badge\":100
    }"
  }
*/

