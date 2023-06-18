import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:google_fonts/google_fonts.dart';

import '../app/controllers/account_controller.dart';

class ShowBalance {
  void showBalanace(BuildContext context, double height, double width) {
    CheckBalance(context, height, width);
  }
}

Future CheckBalance(BuildContext context, double height, double width) {
  return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      context: context,
      builder: (context) {
        return AccountDetailSheet(height, width, context);
      });
}

Widget AccountDetailSheet(double height, double width, BuildContext context) {
  final accountController = Get.put(AccountController());
  // var provider = Provider.of<BalanceCheck>(context, listen: false);
  return Container(
    height: height * 0.15,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     InkWell(
          //       onTap: () => Navigator.pop(context),
          //       child: Icon(
          //         Icons.cancel,
          //         color: Colors.grey,
          //         size: 25,
          //       ),
          //     )
          //   ],
          // ),
          SizedBox(),
          Container(
              alignment: Alignment.center,
              height: height * 0.08,
              decoration: BoxDecoration(
                color: Color(0XFF1d3364),
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  right: width * 0.09,
                  left: width * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Available Balnce",
                            style: GoogleFonts.sarabun(
                                color: Colors.white,
                                fontSize: height * 0.024,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: FutureBuilder(
                              future: accountController.GetWalletBalance(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    "€ ${snapshot.data.toString()}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
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
                          ),
                          Container(
                            child: Text(
                              " €",
                              style: GoogleFonts.sarabun(
                                  color: Colors.white,
                                  fontSize: height * 0.024,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    ),
  );
}
