import 'package:flutter/material.dart';

class Cover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[Image.asset("images/login.png")],
    );
  }
}
