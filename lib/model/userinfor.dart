class UserInfor {
  int code;
  Map data;
  String token;
  int unReadCount;
  bool setPayPass;
  int level;
  int creditValue;
  int withdrawalAmount;

  UserInfor({
    this.code,
    this.data,
    this.token,
    this.unReadCount,
    this.setPayPass,
    this.level,
    this.creditValue,
    this.withdrawalAmount,
  });

  factory UserInfor.fromJson(Map<String, dynamic> json) {
    return new UserInfor(
      code: json["code"],
      data: json["data"],
      token: json["token"],
      unReadCount: json["unReadCount"],
      setPayPass: json["setPayPass"],
      level: json["level"],
      creditValue: json["creditValue"],
      withdrawalAmount: json["withdrawalAmount"],
    );
  }
}

class UserInforData {
  UserInforDataUser user;
}

class UserInforDataUser {
  String signature;
  String photoUrl;
  String city;
  String birthDate;
  String email;
  String _id;
  String phone;
  String name;
}
