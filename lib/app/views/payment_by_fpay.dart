import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/app/controllers/transfer_controller.dart';
import 'package:francepay/app/service/network_handler/networkhandler.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/logo.dart';
import '../../pages/PinPage.dart';

class FpayIdPaymentScreen extends StatefulWidget {
  const FpayIdPaymentScreen({Key? key}) : super(key: key);

  @override
  State<FpayIdPaymentScreen> createState() => _FpayIdPaymentScreenState();
}

class _FpayIdPaymentScreenState extends State<FpayIdPaymentScreen> {
  bool idFound = false;
  bool loading = false;
  bool showErrId = false;
  bool showErrAmount = false;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController msg = TextEditingController();
  String name = "";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController amountController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Logo(height * 0.7),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {
                    // print("check balance");
                    // GetBalance().checkBalance(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PinPage(balance: true)));
                    // showModalBottomSheet(
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10)),
                    //     context: context,
                    //     builder: (context) {
                    //       return Container(
                    //         height: height * 0.3,
                    //         width: width,
                    //       );
                    //     });
                  },
                  child: Text(
                    "Check Balance",
                    style: TextStyle(
                        fontSize: height * 0.02, color: Color(0XFF1d3364)),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.012),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "F-Pay ID",
                    style: TextStyle(
                        fontFamily: "sarabun",
                        fontSize: height * 0.022,
                        color: Color(0XFF757F8C),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height / 15,
                width: width,

                //color: Colors.red,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: width * 0.7,
                          child: TextFormField(
                            controller: textEditingController,
                            readOnly: idFound,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.022,
                                color: Colors.green),
                            cursorHeight: height * 0.023,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.perm_identity_rounded),
                                hintText: " Enter F-Pay ID",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 15, color: Colors.grey)),
                          ),
                        ),
                      ),
                      Container(
                        // width: width * 0.1,
                        child: InkWell(
                          onTap: () async {
                            if (textEditingController.text == null ||
                                textEditingController.text.isEmpty) {
                              setState(() {
                                showErrId = true;
                              });
                            } else {
                              String nameData;
                              var data = await NetWorkHandler.postData(
                                  "getalldetails",
                                  {"walletId": textEditingController.text});
                              nameData = data["data"][0]["firstname"] +
                                  data["data"][0]["lastname"];
                              // if (nameData == null) {
                              //   nameData = data["data"][0]["firstname"] +
                              //       data["data"][0]["lastname"];
                              // }
                              print(nameData);
                              // print(data.toString());
                              setState(() {
                                idFound = true;
                                name = nameData;
                                showErrId = false;
                              });
                            }
                          },
                          child: Text(
                            "Verify",
                            style: GoogleFonts.poppins(
                                fontSize: height * 0.02, color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: showErrId,
                child: Text(
                  "Enter valid Id",
                  style: TextStyle(
                      fontFamily: "sarabun",
                      fontSize: height * 0.018,
                      color: Colors.red,
                      fontWeight: FontWeight.w500),
                ),
              ),
              idFound
                  ? Container(
                      width: width,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            name,
                            style: GoogleFonts.poppins(
                                fontSize: height * 0.02,
                                color: Color(0XFF1d3364)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(height * 0.01),
                            child: CircleAvatar(
                                radius: height * 0.03,
                                backgroundImage: AssetImage(
                                    'assets/images/photoIdentite.jpg')),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  idFound = false;
                                  // textEditingController.clear();
                                });
                              },
                              icon: Icon(Icons.cancel_outlined))
                        ],
                      ),
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.only(left: width * 0.012),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Amount",
                    style: TextStyle(
                        fontFamily: "sarabun",
                        fontSize: height * 0.022,
                        color: Color(0XFF757F8C),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height / 11.5,
                width: width,
                //color: Colors.red,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 2,
                  child: Center(
                      child: IntrinsicWidth(
                    child: TextFormField(
                      controller: amount,
                      readOnly: !idFound,
                      // onChanged: (val) {
                      //   setState(() {
                      //     amount = val;
                      //   });
                      // },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.035,
                          color: Colors.green),
                      cursorHeight: height * 0.03,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIconConstraints: const BoxConstraints(),
                          suffixIcon: Container(
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '€',
                              style: TextStyle(
                                  fontSize: height * 0.05,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green),
                            ),
                          ),
                          // prefixText: "€ 00.00",

                          hintText: " Enter Amount",
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.grey)),
                    ),
                  )),
                ),
              ),
              Visibility(
                visible: showErrAmount,
                child: Text(
                  "Enter Amount",
                  style: TextStyle(
                      fontFamily: "sarabun",
                      fontSize: height * 0.018,
                      color: Colors.red,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.012),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Message (Optional)",
                    style: TextStyle(
                        fontFamily: "sarabun",
                        fontSize: height * 0.022,
                        color: Color(0XFF757F8C),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.22,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: msg,
                  readOnly: !idFound,
                  keyboardType: TextInputType.multiline,
                  scrollPadding: EdgeInsets.only(bottom: 50),
                  style: GoogleFonts.poppins(fontSize: height * 0.02),
                  cursorColor: Colors.black,
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText: "Enter Your Message",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: height * 0.1),
              Container(
                  height: height * 0.06,
                  width: width * 0.75,
                  child: ElevatedButton(
                    onPressed: () {
                      // print(amount);
                      // print(widget.id);
                      if (idFound &&
                          amount.text != null &&
                          amount.text.isNotEmpty) {
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => PinPage(
                                      balance: false,
                                      amount: amount.text,
                                      id: textEditingController.text,
                                      dynamic: false,
                                    )));
                      } else if (!idFound) {
                        setState(() {
                          showErrId = true;
                        });
                      } else {
                        setState(() {
                          showErrAmount = true;
                        });
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0XFF1d3364)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ))),
                    child: Center(
                        child: Text(
                      "Pay",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 18),
                    )),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
