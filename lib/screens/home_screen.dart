// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification/provider/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({required Key key}): super(key: key);
  late HomeNotifier _notifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _notifier = ref.watch(homeProvider.notifier);
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Text("Home Screen"),
          )
        ],
      ),
    );
  }
}