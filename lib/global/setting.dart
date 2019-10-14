import 'dart:convert';

import "package:scoped_model/scoped_model.dart";
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends Model {
  bool _isLogin = false;
  bool get isLogin => _isLogin;
  UserInforData _userinfor;
  UserInforData get userinfor => _userinfor;

  Future<void> saveUserInfor(
      UserInforData userinforData, dynamic userinforDataString) async {
    _isLogin = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userinfor = userinforData;
    prefs.setString("id", userinforData.id);
    print(json.encode(userinforDataString));
    prefs.setString("userinforData", json.encode(userinforDataString));
    notifyListeners();
  }

  Future<void> getUserInfor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic response = json.decode(prefs.getString("userinforData"));
    dynamic responseUser = response["user"];
    UserInforData userinforData = UserInforData(
      city: responseUser["city"],
      signature: responseUser["signature"],
      photoUrl: responseUser["photoUrl"],
      email: responseUser["email"],
      phone: responseUser["phone"],
      id: responseUser["_id"],
      name: responseUser["name"],
      token: response["token"],
      unReadCount: response["unReadCount"],
      setPayPass: response["setPayPass"],
      level: response["level"],
      creditValue: response["creditValue"],
      withdrawalAmount: response["withdrawalAmount"],
    );
    _userinfor = userinforData;
    notifyListeners();
  }
}

class UserInforData {
  String signature;
  String photoUrl;
  String city;
  String birthData;
  String email;
  String phone;
  String name;
  String id;
  String token;
  int unReadCount;
  bool setPayPass;
  int level;
  int creditValue;
  int withdrawalAmount;

  UserInforData({
    this.signature,
    this.photoUrl,
    this.city,
    this.email,
    this.phone,
    this.name,
    this.id,
    this.token,
    this.unReadCount,
    this.setPayPass,
    this.level,
    this.creditValue,
    this.withdrawalAmount,
  });
}
