import "package:flutter/material.dart";
import "views/login-screen/login-screen.dart";
import "views/home-screen/home-screen.dart";

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Welcome to Flutter",
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => LoginScreen(),
        "/home": (BuildContext context) => HomeScreen(),
      },
    );
  }
}
