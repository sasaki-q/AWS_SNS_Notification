import 'package:flutter/cupertino.dart';
import 'package:notification/common/filter_initia_route.dart';
import 'package:notification/common/global_context.dart';
import 'package:notification/screens/home_screen.dart';
import 'package:notification/screens/next_screen.dart';

class App extends StatelessWidget {
  const App({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(brightness: Brightness.light),
      navigatorKey: navigatorKey,
      home: filterInitialRoute(),
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext ctx) => const HomeScreen(key: Key("Home")),
        "/next": (BuildContext ctx) => NextScreen(),
      },
    );
  }
}