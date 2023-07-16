import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/pages/confirmationCode.dart';
import 'package:francepay/pages/newPayment.dart';
import 'package:francepay/pages/welcome.dart';
import 'package:http/http.dart' as http;
import '../widgets/flagAppBar.dart';
import '../widgets/logo.dart';
import '../widgets/nextButton.dart';
import 'idForm.dart';

class NewPhoneNumber extends StatefulWidget {
  const NewPhoneNumber({Key? key}) : super(key: key);

  @override
  NewPhoneNumberState createState() => NewPhoneNumberState();
}

class NewPhoneNumberState extends State<NewPhoneNumber> {
  bool showError = false;

  postData(String number) async {
    var response = await http.post(
      Uri.parse(
          'http://fpay-env.eba-sig8wqw5.eu-west-3.elasticbeanstalk.com/api/otp/phone'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'phone_number': number, "type": "VERIFICATION"}),
    );
    print(response.body);
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    Map<String, String> phoneNumber;
    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp exp = RegExp(pattern);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var response;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              //mainAxisSize: MainAxisSize.max,
              children: [
                const FlagAppBar(),
                SizedBox(
                  height: height * 0.09,
                ),
                Logo(height * 0.70),
                SizedBox(
                  height: height * 0.07,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: width / 10, right: width / 10, bottom: 0),
                  child: Text(
                      "VEUILLEZ ENTRER VOTRE NUMÉRO DE TÉLÉPHONE POUR RÉALISER VOTRE INSCRIPTION",
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
                    "assets/images/phoneNumber.gif",
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
                      controller: phoneController,
                      scrollPadding: EdgeInsets.only(bottom: 40),
                      decoration: InputDecoration(
                        hintText: 'Numéro de téléphone',
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
                                //if (exp.hasMatch(phoneController.text)) {

                                if (phoneController.text != null &&
                                    phoneController.text.isNotEmpty) {
                                  response =
                                      await postData(phoneController.text);
                                  Map<String, dynamic> data =
                                      json.decode(response);
                                  print(phoneController.text);
                                  print(data["Details"]);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewConfirmationCode(
                                                number: phoneController.text,
                                                identification: data["Details"],
                                              )));
                                }
                                //}else{
                                //setState(() {
                                //showError = true;
                                //});
                                //}
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
                Container(
                  child: Text(
                    "Vous devez saisir un numéro de téléphone valide",
                    style: TextStyle(
                        color: showError ? Colors.red : Colors.transparent),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
