class VerifyCode {
  int code;
  String data;
  String msg;

  VerifyCode({
    this.code,
    this.data,
    this.msg,
  });

  factory VerifyCode.fromJson(Map<String, dynamic> json) {
    return new VerifyCode(
      code: json["code"],
      data: json["data"],
      msg: json["msg"],
    );
  }
}
