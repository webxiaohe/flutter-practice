import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

import 'routes/routes.dart';
import 'widget/page-splash.dart';

void main() {
  runApp(PageSplash(
    futures: [
      SharedPreferences.getInstance(),
    ],
    builder: (context, data) {
      return new MyApp(preferences: data[0]);
    },
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;
  MyApp({Key key, @required this.preferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Welcome to Flutter",
      initialRoute: getInitialRoute(),
      onGenerateRoute: routeFactory,
      routes: routes,
    );
  }

  String getInitialRoute() {
    String id = preferences.getString("id");
    if (id != null && id.length > 0) {
      return pageHome;
    }
    return pageWelcome;
  }
}
