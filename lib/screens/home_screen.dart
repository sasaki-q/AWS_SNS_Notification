import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification/common/notification/function.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({required Key key}): super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await showMyNotification();
              },
              child: const Text("send local notification"),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await showMyScheduledNotification();
              },
              child: const Text("send scheduled notification"),
            ),
          ),
        ],
      ),
    );
  }
}