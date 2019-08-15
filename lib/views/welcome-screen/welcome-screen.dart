import "package:flutter/material.dart";
import 'package:scoped_model/scoped_model.dart';

import "package:my_app/services/http.dart";
import 'package:my_app/routes/parameter.dart';
import 'package:my_app/global/setting.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  createState() => new WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  final phoneController = new TextEditingController();
  RegExp validatePhone = new RegExp("^1[3456789]\\d{9}\$");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(vertical: 64),
              child: Text("欢迎来到LIMSCHAIN",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1))),
          ScopedModelDescendant<Settings>(
              builder: (context, child, model) => Column(children: <Widget>[
                    new Text('${model.name}'),
                    GestureDetector(
                        onTap: () {
                          model.setName("lisi");
                        },
                        child: Text(
                          "增加",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        )),
                  ])),
          Form(
            child: TextFormField(
              autovalidate: true,
              autofocus: true,
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "请填写手机号",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter some text";
                }
                if (!validatePhone.hasMatch(value)) {
                  return "手机号格式不正确";
                }
                return null;
              },
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 27.0, bottom: 16.0),
              child: Card(
                  color: Color.fromARGB(255, 0, 192, 141),
                  child: new FlatButton(
                      textColor: Colors.white,
                      onPressed: () {
                        this.sendVertifyCode(context);
                      },
                      child: Text("获取验证码", style: TextStyle(fontSize: 16.0))))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("/login");
                  },
                  child: Text(
                    "密码登录",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  )),
              Text(
                "首次登录将自动注册",
                style: TextStyle(fontSize: 12, color: Colors.black12),
              )
            ],
          )
        ]),
      ),
    );
  }

  void sendVertifyCode(BuildContext context) async {
    var response = await Http.sendVerifyCode({"phone": phoneController.text});
    if (response.code == 0) {
      Navigator.of(context).pushNamed("/login",
          arguments: Welcome(phoneController.text, response.data));
    }
  }
}
