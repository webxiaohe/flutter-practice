import 'dart:convert';

import 'api.dart';
import 'net.dart';
import 'package:my_app/model/verify-code.dart';

class Http {
  static Future doLogin(Map<String, String> params) async {
    var response = await Net.post(Api.DO_LOGIN, params);
    return response;
  }

  static Future<VerifyCode> sendVerifyCode(Map<String, String> params) async {
    final response = await Net.get(Api.Send_Verify_Code, params);
    final responseJson = json.decode(response);
    return new VerifyCode.fromJson(responseJson);
  }
}
