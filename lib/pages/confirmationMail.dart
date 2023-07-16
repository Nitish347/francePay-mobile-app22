import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:francepay/pages/mailForm.dart';
import 'package:http/http.dart' as http;
import '../widgets/flagAppBar.dart';
import '../widgets/nextButton.dart';
import 'congratulationPage.dart';
import 'idForm.dart';

class ConfirmationMail extends StatefulWidget {
  String identification;
  String number;
  String verify;

  ConfirmationMail(
      {Key? key,
      required this.identification,
      required this.number,
      required this.verify})
      : super(key: key);

  @override
  ConfirmationMailState createState() => ConfirmationMailState();
}

class ConfirmationMailState extends State<ConfirmationMail> {
  postData(String otp) async {
    print(widget.number);
    var response = await http.post(
      Uri.parse('https://api.france-pay.fr/api/verify/otp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'verification_key': widget.identification,
        "verify": widget.verify,
        "otp": otp,
        "check": widget.number,
      }),
    );
    print(response.body + "Ezzzzzz");
    return response.body;
  }

  String empty = "-";
  String completed = "#";
  @override
  Widget build(BuildContext context) {
    var response;
    TextEditingController codeController = TextEditingController();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              //mainAxisSize: MainAxisSize.max,
              children: [
                const FlagAppBar(),
                Container(
                  margin: EdgeInsets.only(
                      left: width / 4,
                      right: width / 4,
                      top: height / 20,
                      bottom: height / 20),
                  child: Image.asset("assets/images/logo-main.png"),
                ),

                Container(
                  margin: EdgeInsets.only(
                      left: width / 10, right: width / 10, bottom: 0),
                  child: Text(
                      "VEUILLEZ VALIDER VOTRE COMPTE AVEC LE CODE QUE VOUS AVEZ RECU PAR MAIL",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0XFF1d3364),
                          fontSize: height * 0.022,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  child: Image.asset(
                    "assets/images/mailVerification.gif",
                    height: height * 0.2,
                  ),
                ),

                SizedBox(
                  height: height * 0.05,
                ),

                Container(
                  height: height * 0.06,
                  width: 3 * width / 4,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Colors.black,
                    controller: codeController,
                    //keyboardType: TextInputType.number,
                    //inputFormatters: <TextInputFormatter>[
                    //FilteringTextInputFormatter.digitsOnly
                    //], // Only numbers can be entered
                    scrollPadding: EdgeInsets.only(bottom: 40),
                    decoration: InputDecoration(
                      hintText: 'Code',
                      suffixIcon: Container(
                        width: width * 0.18,
                        decoration: BoxDecoration(
                            color: Color(0XFF1d3364),
                            borderRadius: BorderRadius.circular(10)),
                        height: height / 13,
                        child: IconButton(
                            color: Colors.white,
                            icon: Icon(
                              Icons.send,
                              size: height * 0.03,
                            ),
                            onPressed: () async {
                              print(widget.number);

                              response = await postData(codeController.text);
                              Map<String, dynamic> data = json.decode(response);
                              print(data);
                              if (data["Status"] == "Success") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IdForm(
                                            verify: data["register_verify"])));
                              }
                            }),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true, //<-- SEE HERE
                      fillColor:
                          Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                    ),
                  ),
                ), //NextButton(buttonColor: Color(0XFF1d3364), text: "Suivant", nextPage: IdForm())
              ]),
        ),
      ),
    );
  }
}
