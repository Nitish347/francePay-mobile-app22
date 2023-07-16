import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/app/controllers/transfer_controller.dart';
import 'package:francepay/app/models/current_dynamic_details.dart';
import 'package:francepay/app/views/pages/CurrentTransaction.dart';

import 'package:francepay/widgets/flagAppBar.dart';
import 'package:francepay/widgets/logo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:pinput/pinput.dart';

import '../app/controllers/account_controller.dart';
import '../app/models/current_trsaction_details.dart';
import '../app/views/pages/success.dart';
import '../widgets/AlertBox.dart';
import '../widgets/CheckBalance.dart';

class PinPage extends StatefulWidget {
  bool balance;
  String id;
  String amount;
  bool dynamic;

  PinPage(
      {required this.balance,
      this.amount = "0",
      this.id = "null",
      this.dynamic = true});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final transferController = Get.put(TransferController());
  String pin = "123456";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // var provider = Provider.of<BalanceCheck>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlagAppBar(),
            Container(
              width: width,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "State Bank Of India",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: height * 0.023,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "3585*************",
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontSize: height * 0.021),
                        ),
                      ],
                    ),
                    Logo(height * 0.5)
                  ],
                ),
              ),
            ),
            widget.balance
                ? Container()
                : Container(
                    width: width,
                    color: Colors.grey.withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "To:",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: height * 0.021,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Sending",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: height * 0.021),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.id}@fpay",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: height * 0.022,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${widget.amount} €",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: height * 0.022,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Enter the 6 digit F-Pay Pin",
                style: GoogleFonts.poppins(
                    fontSize: height * 0.022, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Pinput(
              length: 6,
              defaultPinTheme: PinTheme(
                  width: height * 0.06,
                  height: height * 0.06,
                  textStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 2, color: const Color(0xff6E6B7B)),
                    borderRadius: BorderRadius.circular(4),
                  )),
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              keyboardType: TextInputType.number,
              scrollPadding: EdgeInsets.only(bottom: 140),
              autofocus: true,
              closeKeyboardWhenCompleted: false,
              obscureText: true,
              onSubmitted: (val) async {
                print(val.toString());
                if (val.toString() == pin) {
                  if (widget.balance) {
                    // GetBalance().checkBalance(context);
                    Get.back();
                    ShowBalance().showBalanace(context, height, width);
                  } else {
                    setState(() {
                      loading = true;
                    });
                    var data = await transferController.TransferFund(
                        widget.amount, widget.id);
                    String to = data["data"]["destinationAccountNumber"];
                    String from = data["data"]["accountNumber"];
                    Get.off(() => CurrentTransaction(
                        credited: false,
                        amount: widget.amount,
                        from: from,
                        to: to));
                    setState(() {
                      loading = false;
                    });
                  }
                } else {
                  showPinIncorrectAlert(context);
                }
              },
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Visibility(
                visible: loading,
                child: Center(
                  child: CircularProgressIndicator(),
                )),
            SizedBox(
              height: height * 0.2,
            ),
            // provider.loading
            //     ? CircularProgressIndicator(
            //         color: Colors.blue,
            //       )
            //     : Container(),
          ],
        ),
      ),
    );
  }
}
