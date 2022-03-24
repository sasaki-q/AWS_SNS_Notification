import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notification/screens/home_screen.dart';
import 'package:notification/screens/next_screen.dart';

Widget filterInitialRoute() {
  final Box box = Hive.box("box");
  final String path = box.get("path") ?? "";
  box.delete("path");
  switch(path) {
    case "next":
      return NextScreen();

    default:
      return const HomeScreen(key: Key("Home"));
  }
}