import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'cover.dart';
import 'user-infor.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: new Container(
          decoration: BoxDecoration(color: Colors.grey[100]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[Cover(), UserInfor()],
          )),
    );
  }
}
