import "package:flutter/material.dart";

import "package:my_app/services/http.dart";

class UserInfor extends StatefulWidget {
  @override
  createState() => new UserInforState();
}

class UserInforState extends State<UserInfor> {
  final hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);

  final textTips = new TextStyle(fontSize: 16.0, color: Colors.black);

  final userNameController = new TextEditingController();

  final userPwdController = new TextEditingController();

  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          children: <Widget>[
            new TextField(
              style: textTips,
              obscureText: false,
              controller: userNameController,
              decoration: new InputDecoration(
                  hintText: "请输入用户名",
                  hintStyle: hintTips,
                  icon: Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 24,
                  )),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 20),
              child: new TextField(
                style: textTips,
                obscureText: true,
                controller: userPwdController,
                decoration: new InputDecoration(
                    hintText: "请输入密码",
                    hintStyle: hintTips,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                      size: 22,
                    )),
              ),
            ),
            new Container(
                margin: new EdgeInsets.fromLTRB(17, 47, 17, 0),
                child: new Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 6,
                          offset: Offset(0, 6),
                          spreadRadius: -3,
                          color: Color.fromARGB(120, 0, 192, 141))
                    ]),
                    child: new Card(
                        color: Color.fromARGB(255, 0, 192, 141),
                        child: new FlatButton(
                            padding: new EdgeInsets.symmetric(horizontal: 20),
                            onPressed: _login,
                            textColor: Colors.white,
                            child: Text(
                              "马上登录",
                              style: TextStyle(fontSize: 16.0),
                            )))))
          ],
        ));
  }

  void _login() async {
    // var response = await Http.doLogin({
    //   "phone": "18911024431",
    //   "code": "community",
    // });
    if (userNameController.text == "111" && userPwdController.text == "111") {
      Navigator.of(context).pushNamed("/home");
    }
  }
}
