import 'dart:convert';

import 'package:francepay/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class NetWorkHandler {
  static final client = http.Client();
  static final storage = FlutterSecureStorage();
  static Future<String> post(var body, String endpoint) async {
    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });

    return response.body;
  }

  static Future<dynamic> postData(String endpoint, var data) async {
    var token = await NetWorkHandler.getToken();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('POST', buildUrl(endpoint));
    request.body = json.encode(data);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var data = json.decode(res);
      return data;
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<String> get(String endpoint) async {
    var token = await NetWorkHandler.getToken();
    if (token != null) {
      print(token);
      var response = await client.get(buildUrl(endpoint), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      });
      return response.body;
    } else {
      print("token failed to get");
    }

    return jsonEncode({"status": "failed", "msg": "nothing get"});
  }

  static Future<String> check_auth_user(String token, String endpoint) async {
    var response = await client.get(buildUrl(endpoint), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });

    return response.body;
  }

  static Uri buildUrl(String endpoint) {
    String host = "https://api.france-pay.fr/";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static Future<void> storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: "token");
  }

  static Future<String?> removeToken() async {
    await storage.deleteAll();

    if (await storage.read(key: "token") == null) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      print("Faield to empty storage");
    }
  }

  static Future<String> transfer(var body, String endpoint) async {
    var token = await NetWorkHandler.getToken();

    if (token != null) {
      var response =
          await client.post(buildUrl(endpoint), body: body, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      });
      print(response);
      return response.body;
    } else {
      print("token failed to get");
    }

    return jsonEncode({"status": "failed", "msg": "nothing get"});
  }

  static Future<String> webpayment_post(var body, endpoint) async {
    var token = await NetWorkHandler.getToken();
    print(Uri.parse(endpoint));

    if (token != null) {
      var response = await client.post(Uri.parse(endpoint),
          encoding: Encoding.getByName('utf-8'),
          body: body,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
          });
      return response.body;
    } else {
      print(token);
      print("token failed to get");
    }

    return jsonEncode({"status": "failed", "msg": "nothing get"});
  }

  static Future<String> auth_post(var body, String endpoint) async {
    var token = await NetWorkHandler.getToken();

    if (token != null) {
      var response =
          await client.post(buildUrl(endpoint), body: body, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      });
      return response.body;
    } else {
      print(token);
      print("token failed to get");
    }

    return jsonEncode({"status": "failed", "msg": "nothing get"});
  }
}
