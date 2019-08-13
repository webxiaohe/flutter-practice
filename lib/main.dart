import "package:flutter/material.dart";
import 'dart:io';
import 'package:flutter/services.dart';

import 'routes/routes.dart';

void main() {
  runApp(new MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
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
