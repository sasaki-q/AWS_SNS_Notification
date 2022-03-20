import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
BuildContext globalCtx = navigatorKey.currentState!.overlay!.context;