class UserInfor {
  int code;
  UserInforData data;
  String token;
  int unReadCount;
  bool setPayPass;

  UserInfor({
    this.code,
    this.data,
    this.token,
    this.unReadCount,
    this.setPayPass,
  });

  factory UserInfor.fromJson(Map<String, dynamic> json) {
    return new UserInfor(
      code: json["code"],
      data: json["data"],
      token: json["token"],
      unReadCount: json["unReadCount"],
      setPayPass: json["setPayPass"],
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
