import 'dart:convert';

LoginModel LoginmodelFromJson(String str) => LoginModel.fromJson(json.decode(str));
String loginModelToJson (LoginModel data) => json.encode(data.toJson());

class LoginModel {

  LoginModel({
    required this.email,
    required this.password,
  });

  String email;
  String password;
  factory LoginModel.fromJson (Map<String,dynamic> json) => LoginModel(
      email:"email",
      password:"password",
  );

  Map<String, dynamic> toJson() => {
      "email": email,
      "password": password
  };

  }