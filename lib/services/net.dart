import 'package:http/http.dart' as http;
import 'dart:async';

class Net {
  // get
  static Future get(String url, Map<String, dynamic> params) async {
    if (params != null && params.isNotEmpty) {
      // 如果参数不为空，则将参数拼接到URL后面
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    http.Response res = await http.get(url);
    return res.body;
  }

  // post
  static Future post(String url, Map<String, dynamic> params) async {
    http.Response res = await http.post(url, body: params, headers: {
      "Authorization":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZDQzZjFhOTZiNGY0ZDdkNjMyZDBiZmQiLCJuYW1lIjoi5bCP6LS6IiwicGhvbmUiOiIxODkxMTAyNDQzMSIsImlhdCI6MTU2NTAwMjE4MCwiZXhwIjoxNTY3NDIxMzgwfQ.QeyUb7jrXzlgnFejaVz-d5IF-Oiqob9UYf3K5yvAnwk"
    });
    print(res.statusCode);
    return res.body;
  }
}
