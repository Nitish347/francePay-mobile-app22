import 'package:francepay/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:get/state_manager.dart';
import 'package:francepay/app/models/login_model.dart';
import 'package:francepay/app/service/network_handler/networkhandler.dart';
import 'package:http/http.dart' as http;

class SigninController extends GetxController {
  //var isLoading = true.obs;

  Future<dynamic> SiginUser(email, password) async {
    try {
      //isLoading(true);
      LoginModel loginModel = LoginModel(email: email, password: password);
      var response = await NetWorkHandler.post(
          loginModelToJson(loginModel), "api/auth/login");
      if (response != null) {
        print(response);
        var data = json.decode(response);
        print(data["token"]);
        // print(data["token"]["accessToken"]);
        if (data["status"] == true) {
          await NetWorkHandler.storeToken(data["token"]["accessToken"]);
          return {"status": true, "msg": "You are login successfully"};
        } else {
          print("Token not store");
          return {"status": false, "msg": data["msg"]};
        }

        return {"status": false, "msg": "Failed to auth user"};
      }
    } finally {
      //isLoading(false);
    }
  }

  Future<dynamic> SentOtpToPhone(number) async {
    var data = json.encode({"phone_number": number, "type": "VERIFICATION"});

    print(data);

    var response = await NetWorkHandler.post(data, "api/otp/phone");

    if (response != null) {
      print(response);
      var data = json.decode(response);
      if (data['Status'] == "Success") {
        return {
          "status": true,
          "msg": "OTP has sent to number",
          "token": data['Details']
        };
      } else if (data['Status'] == "Failure") {
        return {"status": false, "msg": data['Details']};
      } else {
        return {"status": false, "msg": "Something went wrong"};
      }
    }
  }

  Future<dynamic> VerifyOtpToPhone(identification, otp, number) async {
    var data = json.encode({
      'verification_key': identification,
      "otp": otp,
      "check": number,
    });

    print(data);

    var response = await NetWorkHandler.post(data, "api/verify/otp");
    if (response != null) {
      print(response);
      var data = json.decode(response);
      if (data['Status'] == "Success") {
        return {
          "status": true,
          "msg": "OTP has been successfully verified",
          "token": data['verify']
        };
      } else if (data['Status'] == "Failure") {
        return {"status": false, "msg": data['Details']};
      } else {
        return {"status": false, "msg": "Something went wrong"};
      }
    }
  }

  Future<dynamic> SendOtpToEmail(identification, email) async {
    var data = json.encode(
        {"verify": identification, 'email': email, "type": "VERIFICATION"});

    print(data);

    var response = await NetWorkHandler.post(data, "api/email/otp");
    if (response != null) {
      print(response);
      var data = json.decode(response);
      if (data['Status'] == "Success") {
        return {
          "status": true,
          "msg": "Email has been successfully sent",
          "token": data['Details']
        };
      } else if (data['Status'] == "Failure") {
        return {"status": false, "msg": data['Details']};
      } else {
        return {"status": false, "msg": "Something went wrong"};
      }
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////

  Future<dynamic> VerifyOtpToEmail(identification, code, verify, email) async {
    var data = json.encode({
      'verification_key': identification,
      "verify": verify,
      "otp": code,
      "check": email,
    });

    print(data);

    var response = await NetWorkHandler.post(data, "api/email/otp");
    if (response != null) {
      print(response);
      var data = json.decode(response);
      if (data['Status'] == "Success") {
        return {
          "status": true,
          "msg": "Email has been successfully Verified",
          "token": data['register_verify']
        };
      } else if (data['Status'] == "Failure") {
        return {"status": false, "msg": data['Details']};
      } else {
        return {"status": false, "msg": "Something went wrong"};
      }
    }
  }

  Future<dynamic> RegisterUser(
      firstName, lastName, password, dateOfBirth, verify) async {
    var data = json.encode({
      'firstname': firstName,
      "lastname": lastName,
      "password": password,
      "dateOfBirth": dateOfBirth,
      "register_verify": verify,
    });

    print(data);

    var response = await NetWorkHandler.post(data, "api/auth/register");
    if (response != null) {
      print(response);
      var data = json.decode(response);
      if (data['Status'] == "Success") {
        return {
          "status": true,
          "msg": "User successfully register",
          "token": data['Details']
        };
      } else if (data['Status'] == "Failure") {
        return {"status": false, "msg": data['Details']};
      } else {
        return {"status": false, "msg": "Something went wrong"};
      }
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}
}
