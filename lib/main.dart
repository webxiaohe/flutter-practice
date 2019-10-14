import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scoped_model/scoped_model.dart';

import 'routes/routes.dart';
import 'widget/page-splash.dart';
import 'package:my_app/global/setting.dart';

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
  final Settings settingsModel = Settings();
  final SharedPreferences preferences;
  MyApp({Key key, this.preferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ScopedModel<Settings>(
      model: settingsModel,
      child: new MaterialApp(
        title: "Welcome to Flutter",
        initialRoute: getInitialRoute(),
        onGenerateRoute: routeFactory,
        routes: routes,
      ),
    );
  }

  String getInitialRoute() {
    bool isLogin = preferences.getBool("isLogin");
    if (isLogin != null && isLogin) {
      return pageHome;
    }
    return pageWelcome;
  }
}
