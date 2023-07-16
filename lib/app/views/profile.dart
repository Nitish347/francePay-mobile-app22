import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:francepay/EnterAmount.dart';
import 'package:francepay/app/controllers/account_controller.dart';
import 'package:francepay/app/views/common/bottomnavbar.dart';
import 'package:francepay/pages/qrScanPage.dart';
import 'package:francepay/widgets/flagAppBar.dart';
import 'package:francepay/widgets/invoice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/pages/bankForm.dart';
import 'package:francepay/pages/phoneNumber.dart';
import 'package:francepay/widgets/logo.dart';
import 'package:francepay/widgets/nextButton.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:francepay/widgets/navigationDrawerWidget.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  ProfilState createState() => ProfilState();
}

class ProfilState extends State<Profil> {
  final accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();

    int currentIndex = 4;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        body: Obx(
          () => accountController.isLoading.value
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  children: [
                    FlagAppBar(),
                    Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.05, bottom: height * 0.03),
                        child: Logo(height * 0.7)),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        height: height * 0.18,
                        width: width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.2),
                                blurRadius: 10.0,
                              ),
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: Offset(4.0, 4.0),
                                  blurRadius: 10.0)
                            ]),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: height * 0.06,
                                backgroundImage: NetworkImage(
                                    "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-unknown-social-media-user-photo-default-avatar-profile-icon-vector-unknown-social-media-user-184816085.jpg"),
                              ),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: width / 20),
                                            child: Image.asset(
                                              "assets/images/name.png",
                                              scale: 20,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: width / 20),
                                            child: Image.asset(
                                              "assets/images/phoneIcon.png",
                                              scale: 3,
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  right: width / 20),
                                              child: Text(
                                                "FPAY ID ",
                                                style: TextStyle(
                                                    color: Color(0XFF1d3364),
                                                    fontSize: height * 0.016,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: Text(
                                              accountController
                                                  .user_data['firstname'],
                                              style: TextStyle(
                                                  fontSize: height * 0.025,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              accountController
                                                  .user_data['phone'],
                                              style: TextStyle(
                                                  fontSize: height * 0.02,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              accountController
                                                      .user_data['wallet_id'] +
                                                  "@fpay",
                                              style: TextStyle(
                                                  fontSize: height * 0.017,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFF1d3364))),
                      // child: Card(
                      child: RepaintBoundary(
                        key: globalKey,
                        child: QrImage(
                          data: accountController.user_data['wallet_id'],
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                      ),
                      //),
                    ),
                    Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: width / 3,
                            height: height * 0.05,
                            child: ElevatedButton(
                              onPressed: () async {
                                //await Share.share("Hello 787314480@FPAY is my France pay ID");
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFFCED2D9)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      child: Icon(
                                    Icons.share,
                                    size: 30,
                                    color: Colors.black,
                                  )),
                                  Container(
                                    child: Text(
                                      "Partager QR",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            width: width / 3,
                            height: height * 0.05,
                            child: ElevatedButton(
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EnterAmount(
                                            id: accountController
                                                .user_data['wallet_id'],
                                            generate: true)));
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFFCED2D9)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      child: Icon(
                                    Icons.qr_code_scanner,
                                    size: 30,
                                    color: Colors.black,
                                  )),
                                  Container(
                                    child: Text(
                                      "Dynamic Qr",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
        ),
        // bottomNavigationBar: NavBar(index: 4),
      ),
    );
  }
}

void main() {
  runApp(Profil());
}
