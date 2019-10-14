import "package:flutter/material.dart";
import 'package:scoped_model/scoped_model.dart';

import "package:my_app/services/http.dart";
import "package:my_app/routes/parameter.dart";
import "package:my_app/global/setting.dart";

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
    Welcome loginInfor = ModalRoute.of(context).settings.arguments;
    userNameController.text = loginInfor.phone;
    return ScopedModelDescendant<Settings>(
      builder: (context, child, model) {
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
                      hintText: "请输入手机号",
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
                    obscureText: false,
                    controller: userPwdController,
                    decoration: new InputDecoration(
                        hintText: "请输入验证码",
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
                                padding:
                                    new EdgeInsets.symmetric(horizontal: 20),
                                onPressed: () async {
                                  var response = await Http.doLogin({
                                    "phone": userNameController.text,
                                    "code": userPwdController.text,
                                  });
                                  if (response.code == 0) {
                                    final responseUser = response.data["user"];
                                    UserInforData userInforData = UserInforData(
                                      city: responseUser["city"],
                                      signature: responseUser["signature"],
                                      photoUrl: responseUser["photoUrl"],
                                      email: responseUser["email"],
                                      phone: responseUser["phone"],
                                      id: responseUser["_id"],
                                      name: responseUser["name"],
                                      token: response.token,
                                      unReadCount: response.unReadCount,
                                      setPayPass: response.setPayPass,
                                      level: response.level,
                                      creditValue: response.creditValue,
                                      withdrawalAmount:
                                          response.withdrawalAmount,
                                    );
                                    await model.saveUserInfor(userInforData, response.data);
                                    Navigator.of(context).pushNamed("/home");
                                  }
                                },
                                textColor: Colors.white,
                                child: Text(
                                  "马上登录",
                                  style: TextStyle(fontSize: 16.0),
                                )))))
              ],
            ));
      },
    );
  }
}
