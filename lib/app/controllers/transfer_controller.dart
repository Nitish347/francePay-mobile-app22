import 'dart:convert';
import 'package:francepay/app/routes/app_pages.dart';
import 'package:francepay/app/service/network_handler/networkhandler.dart';
import 'package:get/get.dart';
import 'package:francepay/app/service/network_handler/networkhandler.dart';
import 'package:francepay/app/controllers/account_controller.dart';

import 'account_controller.dart';

class TransferController extends GetxController {
  RxDouble balance = 0.00.obs;

  Future<dynamic> TransferFund(amount, destinationwalletId) async {
    var newAmount = int.parse(amount);

    var data = json.encode({
      "amount": newAmount,
      "destinationwallet_id": destinationwalletId,
      "transfer_type": "user"
    });

    print(data);

    var response = await NetWorkHandler.transfer(data, "transfer");
    if (response != null) {
      print(response);
      var data = json.decode(response);
      if (data['status'] == true) {
        return {
          "status": true,
          "msg": data['msg'],
          "data": data['transaction']
        };
      } else if (data['status'] == false) {
        return {"status": false, "msg": data['msg']};
      } else {
        return {"status": false, "msg": "Something went wrong"};
      }
    }
  }

  Future<dynamic> getAllDetails() {
    var res = NetWorkHandler.post({"walletId": "163659096"}, "getalldetails");
    print(res.toString());
    return res;
  }

  Future<dynamic> DeposideFund(amount) async {
    var newAmount = int.parse(amount);

    var data = json.encode({
      "amount": newAmount,
    });

    print(data);

    var response = await NetWorkHandler.transfer(data, "deposit");
    if (response != null) {
      print(response);
      var data = json.decode(response);
      if (data['status'] == true) {
        return {"status": true, "msg": data['msg'], "data": data['data']};
      } else if (data['status'] == false) {
        return {"status": false, "msg": data['msg']};
      } else {
        return {"status": false, "msg": "Something went wrong"};
      }
    }
  }

  Future<dynamic> Bank_Reg(OwnerName, AddressLine1, AddressLine2, City, Region,
      PostalCode, Country, IBAN, BIC) async {
    var data = json.encode({
      "OwnerName": OwnerName,
      "AddressLine1": AddressLine1,
      "AddressLine2": AddressLine2,
      "City": City,
      "Region": Region,
      "PostalCode": PostalCode,
      "Country": Country,
      "IBAN": IBAN,
      "BIC": BIC
    });

    print(data);

    var response = await NetWorkHandler.auth_post(data, "add_bank");
    if (response != null) {
      print(response);
      var data = json.decode(response);
      if (data['status'] == true) {
        return {"status": true, "msg": data['msg'], "data": data['data']};
      } else if (data['status'] == false) {
        return {"status": false, "msg": data['msg']};
      } else {
        return {"status": false, "msg": "Something went wrong"};
      }
    }
  }

  Future<dynamic> Card_Reg() async {
    var data = json.encode({});

    print(data);

    var response = await NetWorkHandler.auth_post(data, "card_reg");
    if (response != null) {
      print(response);
      var data = json.decode(response);
      if (data['status'] == true) {
        return {"status": true, "msg": data['msg'], "data": data['data']};
      } else if (data['status'] == false) {
        return {"status": false, "msg": data['msg']};
      } else {
        return {"status": false, "msg": "Something went wrong"};
      }
    }
  }

  Future<dynamic> Card_Reg_by_Id(Id, token) async {
    var data = json.encode({
      "card_token": token,
    });

    print(data);

    var response = await NetWorkHandler.auth_post(data, "card_reg_token/$Id");
    if (response != null) {
      print(response);
      var data = json.decode(response);
      if (data['status'] == true) {
        return {"status": true, "msg": data['msg'], "data": data['data']};
      } else if (data['status'] == false) {
        return {"status": false, "msg": data['msg']};
      } else {
        return {"status": false, "msg": "Something went wrong"};
      }
    }
  }

  Future<dynamic> Card_Reg_Third_Token(
      accesskey, preregdata, cardnumber, expdate, cvc) async {
    var data = {
      "accessKeyRef": accesskey,
      "data": preregdata,
      "cardNumber": cardnumber,
      "cardExpirationDate": expdate,
      "cardCvx": cvc,
    };

    print(data);

    var response = await NetWorkHandler.webpayment_post(data,
        "https://homologation-webpayment.payline.com/webpayment/getToken");
    if (response != null) {
      print(response);
      var string = response;

      var parts = string.split("=");
      String part1 = parts[0];
      print(part1); // 004
      String part2 = parts[1];
      print(part2);

      if (part1 == "data") {
        print("data");

        return {
          "status": true,
          "msg": "Card has been successfully added",
          "data": response
        };
      } else if (part1 == "errorCode") {
        print("Error " + part2);
        return {"status": false, "msg": "Error from server code " + part2};
      } else {
        print("Array splitting wrong");
        return {"status": false, "msg": "Array splitting wrong"};
      }

      /*
      var data = json.decode(response);
      if(data['status'] == true){
        return {
          "status" : true,
          "msg" : data['msg'],
          "data": data['data']
        };

      }
      else if(data['status'] == false) {
        return {
          "status" : false,
          "msg" : data['msg']
        };

      }

      else{

        return {
          "status" : false,
          "msg" : "Something went wrong"
        };

      }*/

    }
  }

  Future<dynamic> GetWalletBalance() async {
    var response = await NetWorkHandler.get("balance");
    if (response != null) {
      var data = json.decode(response);
      print(data["balance"]);
      balance.value = (data["balance"].toDouble());
      return data["balance"];
    }
  }

  Future<dynamic> FetchallBank() async {
    var data = json.encode({});

    var response = await NetWorkHandler.auth_post(data, "fetch_bank");
    if (response != null) {
      print(response);
      var data = json.decode(response);
      return data;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await GetWalletBalance();
    print("on it");
  }

  @override
  void onReady() async {
    super.onReady();
    print("on ready");
  }

  @override
  void onClose() {}
}

class Country {
  String IBAN;
  String BIC;

  Country({required this.IBAN, required this.BIC});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      IBAN: json['IBAN'],
      BIC: json['BIC'],
    );
  }
}

class CountryService {
  static Future<List<Country>> getCountries() async {
    var data = json.encode({});

    var response = await NetWorkHandler.auth_post(data, "fetch_bank");
    if (response != null) {
      print(response);
      var data = json.decode(response);
      final List<dynamic> countriesJson = jsonDecode(response);
      return countriesJson.map((json) => Country.fromJson(json)).toList();
      return data;
    }

    return [];
  }
}
