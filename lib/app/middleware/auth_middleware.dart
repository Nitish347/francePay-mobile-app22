import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:francepay/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:francepay/app/service/network_handler/networkhandler.dart';
import 'dart:convert';

class AuthMiddleware extends GetMiddleware{
  @override
  int ?get priority  => 1;
  //bool isAuthenticated = false;

  checkLogin() async{
    String? token = await NetWorkHandler.getToken();
    if(token != null) {
      String? response = await NetWorkHandler.check_auth_user(token, "/api/user");
      var data = json.decode(response);

      if(data["status"] == "success") {
          print("Auth successs so you can processs");
      //  Get.toNamed("/account",arguments: data["data"]);
      }
      else{

        print("Something went wrong while checking token");
        Get.toNamed(Routes.HOME);
      }
    }
    else{
      print("token is null ");
      Get.offAllNamed(Routes.HOME);
    }
  }




  @override
  RouteSettings?redirect(String? route){
    checkLogin();
  }

  @override
  GetPage? onPageCalled(GetPage? page){
    return super.onPageCalled(page);
  }

  //This function will be called right before the Bindings are initialized.
  // Here we can change Bindings for this page.
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    return super.onBindingsStart(bindings);
  }

  //This function will be called right after the Bindings are initialized.
  // Here we can do something after  bindings created and before creating the page widget.
  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    return super.onPageBuildStart(page);
  }

  // Page build and widgets of page will be shown
  @override
  Widget onPageBuilt(Widget page) {
    return super.onPageBuilt(page);
  }

  //This function will be called right after disposing all the related objects
  // (Controllers, views, ...) of the page.
  @override
  void onPageDispose() {
    super.onPageDispose();
  }







}



