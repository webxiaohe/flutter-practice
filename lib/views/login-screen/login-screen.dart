import "package:flutter/material.dart";

import "user-infor.dart";
import "cover.dart";

class LoginScreen extends StatefulWidget {
  @override
  createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[Cover(), UserInfor()],
        ),
      )),
    );
  }
}
