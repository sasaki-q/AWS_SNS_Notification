// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Text("Next Screen"),
          )
        ],
      ),
    );
  }
}