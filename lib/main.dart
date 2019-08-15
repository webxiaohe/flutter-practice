import "package:flutter/material.dart";
import 'package:scoped_model/scoped_model.dart';

import 'routes/routes.dart';

import 'package:my_app/global/setting.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ScopedModel<Settings>(
      model: new Settings(),
      child: new MaterialApp(
        title: "Welcome to Flutter",
        initialRoute: "/",
        onGenerateRoute: routeFactory,
        routes: routes,
      ),
    );
  }
}
