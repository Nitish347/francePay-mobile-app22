import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/Constants/Constants.dart';
import 'package:francepay/pages/profil.dart';
import 'package:francepay/pages/qrScanPage.dart';
import 'package:francepay/widgets/TransactionCard.dart';
import 'package:francepay/widgets/nextButton.dart';
import 'package:get/get.dart';
import 'package:francepay/widgets/flagAppBar.dart';
import 'package:francepay/widgets/navigationDrawerWidget.dart';
import 'package:francepay/pages/createTransaction.dart';
import 'package:francepay/pages/gerer.dart';
import 'package:francepay/app/controllers/account_controller.dart';
import 'package:francepay/app/views/common/bottomnavbar.dart';
import 'package:intl/intl.dart';

import '../../widgets/appBar.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  MainMenuState createState() => MainMenuState();
}

class MainMenuState extends State<MainMenu> {
  final accountController = Get.put(AccountController());
  @override
  void initState() {
    // TODO: implement initState
    AccountController().GetAllRequest();
  }

  @override
  Widget build(BuildContext context) {
    print(accountController.FetchallBank());

    int currentIndex = 0;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // print(accountController.GetWalletBalance());

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      // appBar: FpayAppBar(height, context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.012),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Money Transfer",
                    style: TextStyle(
                        fontFamily: "sarabun",
                        fontSize: height * 0.025,
                        color: blueColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                height: height * 0.17,
                width: width,
                //color: Colors.red,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.toNamed("/profile");
                            },
                            child:
                                blocks(height, width, "Profile", Icons.person)),
                        InkWell(
                          onTap: () {
                            Get.toNamed("/fpay_id_payment");
                          },
                          child: blocks(height, width, "To F-Pay Id",
                              Icons.perm_identity_sharp),
                        ),
                        blocks(height, width, "To Bank Account",
                            Icons.account_balance),
                        InkWell(
                          onTap: () => Get.toNamed("/contact"),
                          child: blocks(height, width, "Send Request",
                              Icons.request_page),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.012),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Solde",
                    style: TextStyle(
                        fontFamily: "sarabun",
                        fontSize: height * 0.022,
                        color: blueColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.009,
              ),
              //  Obx(
              ///  () =>
              Container(
                  height: height / 11.5,
                  width: width,
                  //color: Colors.red,

                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 5,
                    child: Center(
                      child: FutureBuilder(
                        future: accountController.GetWalletBalance(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              "€ ${snapshot.data.toString()}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0XFF118C4F),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "sarabun",
                                  fontSize: height * 0.028),
                            );
                          } else {
                            print("This works...");
                            return CircularProgressIndicator();
                          }
                        },
                      ),

                      //child: Text(accountController.balance.value.toString(), textAlign: TextAlign.center, style: TextStyle(color: Color(0XFF118C4F), fontWeight: FontWeight.w600, fontFamily: "sarabun", fontSize: 20),),
                    ),
                  )),
              // ),
              SizedBox(
                height: height * 0.018,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.012),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Transactions",
                    style: TextStyle(
                        fontFamily: "sarabun",
                        fontSize: height * 0.025,
                        color: blueColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              // Container(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Column(
              //         children: [
              //           Container(
              //             height: height / 9,
              //             width: width / 3.5,
              //             child: GestureDetector(
              //               onTap: () {
              //                 /***** *****/
              //                 print("go bank");
              //                 Get.toNamed("/bank");
              //               },
              //               child: Card(
              //                   color: Color(0XFF1d3364),
              //                   child: Align(
              //                       alignment: Alignment.center,
              //                       child: Image.asset(
              //                         "assets/images/bankWhite.png",
              //                         scale: 10,
              //                       ))),
              //             ),
              //           ),
              //           Container(
              //               child: Text(
              //             "Compte bancaire",
              //             style: TextStyle(
              //                 fontSize: 10,
              //                 fontFamily: "sarabun",
              //                 fontWeight: FontWeight.w600),
              //           ))
              //         ],
              //       ),
              //       Column(
              //         children: [
              //           Container(
              //             height: height / 9,
              //             width: width / 3.5,
              //             child: GestureDetector(
              //               onTap: () {
              //                 /***** *****/
              //                 print("go bank");
              //                 Get.toNamed("/transfer");
              //               },
              //               child: Card(
              //                   //color: Color(0XFF1d3364),
              //                   child: Align(
              //                       alignment: Alignment.center,
              //                       child: Image.asset(
              //                           "assets/images/transfert.png",
              //                           scale: 10))),
              //             ),
              //           ),
              //           Container(
              //               child: Text(
              //             "Transfert",
              //             style: TextStyle(
              //                 fontSize: 10,
              //                 fontFamily: "sarabun",
              //                 fontWeight: FontWeight.w600),
              //           ))
              //         ],
              //       ),
              //       Column(
              //         children: [
              //           Container(
              //             height: height / 9,
              //             width: width / 3.5,
              //             child: GestureDetector(
              //               onTap: () {
              //                 /***** *****/
              //                 print("go bank");
              //                 Get.toNamed("/card");
              //               },
              //               child: Card(
              //                   color: Color(0XFFED2939),
              //                   child: Align(
              //                       alignment: Alignment.center,
              //                       child: Image.asset(
              //                         "assets/images/addCardIcon.png",
              //                         scale: 15,
              //                       ))),
              //             ),
              //           ),
              //           Container(
              //               child: Text(
              //             "Carte bancaire",
              //             style: TextStyle(
              //                 fontSize: 10,
              //                 fontFamily: "sarabun",
              //                 fontWeight: FontWeight.w600),
              //           ))
              //         ],
              //       ),
              //     ],
              //   ),
              // ),

              // Container(
              //   margin:
              //       EdgeInsets.only(top: height / 40, right: 3 * width / 4.5),
              //   //margin: EdgeInsets.only(),
              //   child: Text(
              //     "Transactions",
              //     style: TextStyle(
              //         fontFamily: "sarabun",
              //         color: Color(0XFF757F8C),
              //         fontWeight: FontWeight.w500),
              //   ),
              // ),

              Container(
                height: height / 2.65,
                width: width / 1.1,
                // color: Colors.blue,
                child: FutureBuilder<dynamic>(
                  future: accountController.FetchTran(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          //if no data
                          itemBuilder: (context, index) {
                            //convert date time format
                            var date = DateTime.parse(
                                snapshot.data[index]['createdAt'].toString());

                            var formatedDate =
                                DateFormat('dd-MM-yyyy hh:mm').format(date);
                            String name = snapshot.data[index]
                                    ['destinationAccountNumber']
                                .toString();
                            String amount =
                                snapshot.data[index]['amount'].toString();

                            if (snapshot.data[index]['amount'] < 0) {
                              return TransactionsCard(height, width, false,
                                  name, formatedDate, amount, context, false);
                            } else if (snapshot.data[index]['amount'] > 0) {
                              var refence = null;

                              //if array split exist
                              if (snapshot.data[index]['reference']
                                      .split("transfer_from_account:")
                                      .length >
                                  1) {
                                var ref = snapshot.data[index]['reference']
                                    .split("transfer_from_account:");
                                refence = ref[1] + "@fpay";
                              } else {
                                refence = "Deposide from bank";
                              }

                              print(refence);

                              return Card(
                                //green
                                color: Color(0xFF118C4F),
                                child: Container(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: width / 100),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/photoIdentite.jpg"),
                                        radius: 20,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: width / 50, top: height / 70),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            refence,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Container(
                                              //margin: EdgeInsets.only(left: width/27),
                                              child: Text(formatedDate,
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: width / 2.5),
                                        child: Text(
                                            snapshot.data[index]['amount']
                                                    .toString() +
                                                "€",
                                            style: TextStyle(
                                                color: Colors.white))),
                                  ],
                                )),
                              );
                            } else {
                              return Center(
                                child: Text("No Data"),
                              );
                            }
                          });
                      //return Text('${snapshot.data}', textAlign: TextAlign.center, style: TextStyle(color: Color(0XFF118C4F), fontWeight: FontWeight.w600, fontFamily: "sarabun", fontSize: 20),);
                    } else {
                      print("This works...");
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
              ////////////////////////////////////////////////////////////////////////feth//////

              // Container(
              //   margin: EdgeInsets.only(right: 3 * width / 4),
              //   child: Text(
              //     "Banks",
              //     style: TextStyle(
              //         fontFamily: "sarabun",
              //         color: Color(0XFF757F8C),
              //         fontWeight: FontWeight.w500),
              //   ),
              // ),
              // Container(
              //   height: height / 10,
              //   width: width / 1.1,
              //   //color: Colors.red,
              //   //  child: Card(
              //   //color: Color(0xFFFA2E69),
              //
              //   child: FutureBuilder<dynamic>(
              //     future: accountController.FetchallBank(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         //if no snapshot has no data
              //
              //         return ListView.builder(
              //           itemCount: snapshot.data.length,
              //           itemBuilder: (context, index) {
              //             return Card(
              //                 child: Container(
              //                     child: Row(
              //               children: [
              //                 Container(
              //                   margin: EdgeInsets.only(left: width / 100),
              //                   child: Image.asset("assets/images/bankimg.png",
              //                       scale: 30),
              //                 ),
              //                 Container(
              //                   margin: EdgeInsets.only(left: width / 50),
              //                   child: Text(snapshot.data[0]['IBAN']),
              //                 ),
              //               ],
              //             )));
              //           },
              //         );
              //         //return Text('${snapshot.data}', textAlign: TextAlign.center, style: TextStyle(color: Color(0XFF118C4F), fontWeight: FontWeight.w600, fontFamily: "sarabun", fontSize: 20),);
              //       } else {
              //         print("This works...");
              //         return CircularProgressIndicator();
              //       }
              //
              //       if (snapshot.hasData) {
              //         return Card(
              //             child: Container(
              //                 child: Row(
              //           children: [
              //             Container(
              //               margin: EdgeInsets.only(left: width / 100),
              //               child: Image.asset("assets/images/bankimg.png",
              //                   scale: 30),
              //             ),
              //             Container(
              //               margin: EdgeInsets.only(left: width / 50),
              //               child: Text("N:1434535753356"),
              //             ),
              //           ],
              //         )));
              //         //return Text('${snapshot.data}', textAlign: TextAlign.center, style: TextStyle(color: Color(0XFF118C4F), fontWeight: FontWeight.w600, fontFamily: "sarabun", fontSize: 20),);
              //       } else {
              //         print("This works...");
              //         return CircularProgressIndicator();
              //       }
              //     },
              //   ),
              //   //  child:
              //   // )
              // ),
              // Container(
              //   margin: EdgeInsets.only(right: 3 * width / 4),
              //   child: Text(
              //     "Cards",
              //     style: TextStyle(
              //         fontFamily: "sarabun",
              //         color: Color(0XFF757F8C),
              //         fontWeight: FontWeight.w500),
              //   ),
              // ),
              // Container(
              //   height: height / 10,
              //   width: width / 1.1,
              //   //color: Colors.red,
              //   //  child: Card(
              //   //color: Color(0xFFFA2E69),
              //
              //   child: FutureBuilder<dynamic>(
              //     future: accountController.FetchallCard(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         return ListView.builder(
              //           itemCount: snapshot.data.length,
              //           itemBuilder: (context, index) {
              //             return Card(
              //                 child: Card(
              //                     child: Container(
              //                         child: Row(
              //               children: [
              //                 Container(
              //                   margin: EdgeInsets.only(left: width / 100),
              //                   child: Image.asset(
              //                       "assets/images/mastercard-26161.png",
              //                       scale: 30),
              //                 ),
              //                 Container(
              //                   margin: EdgeInsets.only(left: width / 50),
              //                   child: Text(snapshot.data[0]['Alias']),
              //                 ),
              //               ],
              //             ))));
              //           },
              //         );
              //         return Card(
              //             child: Container(
              //                 child: Row(
              //           children: [
              //             Container(
              //               margin: EdgeInsets.only(left: width / 100),
              //               child: Image.asset(
              //                   "assets/images/mastercard-26161.png",
              //                   scale: 30),
              //             ),
              //             Container(
              //               margin: EdgeInsets.only(left: width / 50),
              //               child: Text("N:1434535753356"),
              //             ),
              //           ],
              //         )));
              //         //return Text('${snapshot.data}', textAlign: TextAlign.center, style: TextStyle(color: Color(0XFF118C4F), fontWeight: FontWeight.w600, fontFamily: "sarabun", fontSize: 20),);
              //       } else {
              //         print("This works...");
              //         return CircularProgressIndicator();
              //       }
              //     },
              //   ),
              //   //  child:
              //   // )
              // ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: NavBar(index: 0),
    );
  }
}

Widget blocks(double height, double width, String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      // color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(height * 0.007),
            child: CircleAvatar(
              radius: height * 0.035,
              backgroundColor: Color(0XFF1d3364),
              child: Icon(
                icon,
                size: height * 0.04,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: width * 0.16,
            child: Text(
              "$title",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: height * 0.018, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    ),
  );
}
