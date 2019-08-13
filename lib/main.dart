import "package:flutter/material.dart";

import 'routes/routes.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Welcome to Flutter",
      initialRoute: "/",
      onGenerateRoute: routeFactory,
      routes: routes,
    );
  }
}
