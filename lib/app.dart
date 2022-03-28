import 'package:flutter/cupertino.dart';
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
      routes: <String, WidgetBuilder>{
        "/": (BuildContext ctx) => HomeScreen(key: const Key("Home")),
        "/next": (BuildContext ctx) => NextScreen(),
      },
    );
  }
}