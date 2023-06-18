import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:francepay/app/controllers/sigin_controller.dart';
import 'package:francepay/pages/mailForm.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../widgets/flagAppBar.dart';
import '../widgets/nextButton.dart';
import 'congratulationPage.dart';
import 'idForm.dart';

import 'package:quickalert/quickalert.dart';

class ConfirmationCode extends StatefulWidget {
  String identification;
  String number;

  ConfirmationCode({Key? key, required this.identification, required this.number}) : super(key: key);


  @override
  ConfirmationCodeState createState() => ConfirmationCodeState();
}

class ConfirmationCodeState extends State<ConfirmationCode> {


  final SigninController sigInController = Get.put(SigninController());
  TextEditingController codeController = TextEditingController();

  bool isLoading = false;


  paymentSuccess(data){
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: data,
    );
  }

  paymentFaield(data){ QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Oops...',
    text: data,
  );

  }



  postData(String otp) async{
    print(widget.number);
    var response = await http.post(
      Uri.parse('https://api.france-pay.fr/api/verify/otp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'verification_key': widget.identification,
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


    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            //mainAxisSize: MainAxisSize.max,
              children: [
                const FlagAppBar(),
                Container(
                  margin: EdgeInsets.only(left: width/4, right: width/4, top: height/20, bottom: height/20),
                  child: Image.asset("assets/images/logo-main.png"),),
                Container(
                  margin: EdgeInsets.only(left: width/6, right: width/6, bottom: 0),
                  child: Text("VEUILLEZ VALIDER VOTRE COMPTE AVEC LE CODE QUE VOUS AVEZ RECU PAR SMS", textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width/6, right: width/6, bottom: 0, top: height/20),
                  child: Image.asset("assets/images/phoneNumber.gif"),
                ),
                Container(
                  margin: EdgeInsets.only(top: height/20, bottom: height/20, ),
                  width: 3*width/4,
                  child: TextField(
                    controller: codeController,
                    //keyboardType: TextInputType.number,
                    //inputFormatters: <TextInputFormatter>[
                      //FilteringTextInputFormatter.digitsOnly
                    //], // Only numbers can be entered
                    scrollPadding:  EdgeInsets.only(bottom:40),
                    decoration: InputDecoration(
                      hintText: 'Code',

                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true, //<-- SEE HERE
                      fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0XFF1d3364),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: height/13,

                  child: IconButton(

                      color: Colors.white,
                      icon: Icon(Icons.send),

                      onPressed: () async {

                        if (codeController.text == null || codeController.text.isEmpty) {
                          paymentFaield("Code number is empty");
                        }

                        else {
                          setState(() {
                            isLoading = true;
                          });


                          var data = await sigInController.VerifyOtpToPhone(widget.identification,codeController.text,widget.number);

                          if (data['status'] == true) {
                            paymentSuccess(data['msg']);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MailForm(validationKey: data["token"], verify: data["token"]))
                            );
                          }

                          else if (data['status'] == false) {
                            paymentFaield(data['msg']);
                          }
                          else {
                            paymentFaield(data['msg']);
                          }

                          setState(() {
                            isLoading = false;
                          });
                        }

/*
                        print(widget.number);

                          response = await postData(codeController.text);
                          Map<String, dynamic> data = json.decode(response);
                          print(data);
                        if (data["Status"] == "Success") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MailForm(validationKey: data["verify"], verify: data["verify"])));
                        }*/
                      }
                  ),
                ),
                //NextButton(buttonColor: Color(0XFF1d3364), text: "Suivant", nextPage: IdForm())
              ]
          ),
        ),
      ),
    );
  }
}
