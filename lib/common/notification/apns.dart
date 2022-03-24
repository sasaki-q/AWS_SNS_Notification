import 'package:flutter/material.dart';
import 'package:flutter_apns/flutter_apns.dart';
import 'package:hive/hive.dart';
import 'package:notification/common/notification/local.dart';

final PushConnector connector = createPushConnector();

void initAPNs() {
  final Box box = Hive.box("box");
  connector.token.addListener(() {
      debugPrint('DEBUG Device Token === ${connector.token.value}');
  });

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
      box.put("path", message.notification!.title);
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
    "default" : "Notification title",
    "APNS_SANDBOX" : {
        "aps" : {
          	"subtitle": "Custom subtitle"
            "badge" : 1,
            "alert" : "hello vietnam"
        },
        "data" : {
          "path": "path"
        }
    }
  } 
*/

