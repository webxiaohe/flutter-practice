import 'package:flutter/material.dart';

import "package:scoped_model/scoped_model.dart";
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends Model {
  static Settings of(BuildContext context) {
    return ScopedModel.of(context);
  }

  bool _isLogin = false;
  bool get isLogin => _isLogin;
  UserInforData _userinfor;
  UserInforData get userinfor => _userinfor;
  SharedPreferences _preferences;

  void saveUserInfor(UserInforData userinforData) {
    _isLogin = true;
    _userinfor = userinforData;
    _preferences.setString("id", userinforData.id);
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
