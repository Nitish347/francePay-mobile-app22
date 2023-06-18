import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class SiginDBAPI {
  static var client = http.Client();

  static SiginPostrequest(email,password) async {
    var response = await http.post(
      Uri.parse('https://api.france-pay.fr/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        "password": password,
      }),
    );

    return response.body;


}

}