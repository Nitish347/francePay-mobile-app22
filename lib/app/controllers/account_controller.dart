import 'dart:convert';

import 'package:francepay/app/routes/app_pages.dart';
import 'package:francepay/app/service/network_handler/networkhandler.dart';
import 'package:get/get.dart';
import 'package:francepay/app/service/network_handler/networkhandler.dart';

class AccountController extends GetxController {

  RxDouble balance = 0.00.obs;
  RxMap user_data = {}.obs;
  RxBool isLoading = false.obs;


  // ignore: non_constant_identifier_names
  Future<dynamic> GetWalletBalance() async {
      isLoading.value = true;
      var response = await NetWorkHandler.get("balance");
      if (response != null) {
        var data = json.decode(response);
        print(data["balance"]);
        balance.value = (data["balance"].toDouble());
        isLoading.value  = false;
        return data["balance"];
      }

  }

  Future<dynamic> GetCurrentUser() async {
    isLoading.value  = true;
    print("This work $isLoading.value ");
    String? token = await NetWorkHandler.getToken();
    if (token != null) {
      String? response = await NetWorkHandler.check_auth_user(
          token, "/api/user");
      var data = json.decode(response);

      if (data["status"] == "success") {
        print("Data get success");
        user_data.value = data["data"];
        return data["data"];

      }
      else {
        print("Something went wrong while checking token");
      }
    }

    isLoading.value  = false;
    print(isLoading.value);
  }





  Future<dynamic> FetchTran() async {
    var data = json.encode({});


    var response = await NetWorkHandler.get("all_transactions?limit=10");
    if (response != null) {
      print(response);
      var data = json.decode(response);
      return data;
    }
  }


  Future<dynamic> FetchallCard() async {
    var data = json.encode({});


    var response = await NetWorkHandler.auth_post(data, "fetch_card");
    if (response != null) {
      print(response);
      var data = json.decode(response);
      return data;
    }
  }



  Future<dynamic> FetchallBank() async {

    var data = json.encode({});


    var response = await NetWorkHandler.auth_post(data,"fetch_bank");
    if (response != null) {
      print(response);
      var data = json.decode(response);
      return data;


   /*   if(data['status'] == true){
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


  @override
  Future<void> onInit() async {
    super.onInit();
    await GetWalletBalance();
    await GetCurrentUser();

  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

}

class GlobalEntity {
  String? dailySummary;
  String? image;
  String? source;
  String? countries;
  String? lastUpdate;

  GlobalEntity({
    this.dailySummary,
    this.image,
    this.source,
    this.countries,
    this.lastUpdate});
}
