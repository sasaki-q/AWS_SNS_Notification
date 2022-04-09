import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:notification/common/global_context.dart';

final homeProvider = StateNotifierProvider((ref) => HomeNotifier());

class HomeNotifier extends StateNotifier {
  final box = Hive.box("box");
  HomeNotifier() : super("") {
    final String? path = box.get("path");
    if(path != null) {
      Navigator.of(globalCtx).pushNamed("/$path");
      box.delete("path");
    }
  }
}