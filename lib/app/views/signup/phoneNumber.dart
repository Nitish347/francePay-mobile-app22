import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/app/controllers/sigin_controller.dart';
import 'package:francepay/app/views/signup/confirmationCode.dart';
import 'package:francepay/pages/newPayment.dart';
import 'package:francepay/pages/welcome.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:francepay/widgets/flagAppBar.dart';
import 'package:francepay/widgets/nextButton.dart';
import 'package:francepay/pages/idForm.dart';
import 'package:quickalert/quickalert.dart';

class OldPhoneNumber extends StatefulWidget {
  const OldPhoneNumber({Key? key}) : super(key: key);

  @override
  OldPhoneNumberState createState() => OldPhoneNumberState();
}

class OldPhoneNumberState extends State<OldPhoneNumber> {
  TextEditingController phoneController = TextEditingController();
  final SigninController sigInController = Get.put(SigninController());

  bool isLoading = false;

  paymentSuccess(data) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: data,
    );
  }

  paymentFailed(data) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: data,
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> phoneNumber;
    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp exp = RegExp(pattern);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var response;

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
                      left: width / 6, right: width / 6, bottom: 0),
                  child: Text(
                    "VEUILLEZ ENTRER VOTRE NUMÉRO DE TÉLÉPHONE POUR RÉALISER VOTRE INSCRIPTION",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: width / 6,
                      right: width / 6,
                      bottom: 0,
                      top: height / 20),
                  child: Image.asset("assets/images/phoneNumber.gif"),
                ),
                Container(
                    margin: EdgeInsets.only(top: height / 15),
                    width: 3 * width / 4,
                    child: TextField(
                      controller: phoneController,
                      scrollPadding: EdgeInsets.only(bottom: 40),
                      decoration: InputDecoration(
                        hintText: 'Numéro de téléphone',
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                              color: Color(0XFF1d3364),
                              borderRadius: BorderRadius.circular(10)),
                          height: height / 13,
                          child: IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.send),
                              onPressed: () async {
                                //if (exp.hasMatch(phoneController.text)) {

                                if (phoneController.text == null ||
                                    phoneController.text.isEmpty) {
                                  paymentFailed("Numéro de télphone invalide");
                                } else {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  var data =
                                      await sigInController.SentOtpToPhone(
                                          phoneController.text);

                                  if (data['status'] == true) {
                                    paymentSuccess(data['msg']);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ConfirmationCode(
                                                  number: phoneController.text,
                                                  identification: data['token'],
                                                )));
                                  } else if (data['status'] == false) {
                                    paymentFailed(data['msg']);
                                  } else {
                                    paymentFailed(data['msg']);
                                  }

                                  setState(() {
                                    isLoading = false;
                                  });
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
                    )),
                // Container(
                //  child: Text("Vous devez saisir un numéro de téléphone valide", style: TextStyle(color: showError ? Colors.red : Colors.transparent),),
                // )
              ]),
        ),
      ),
    );
  }
}
