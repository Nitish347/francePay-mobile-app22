

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/app/controllers/sigin_controller.dart';
import 'package:http/http.dart' as http;
import 'package:francepay/widgets/flagAppBar.dart';
import 'package:francepay/pages/confirmationMail.dart';

import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class MailForm extends StatefulWidget {
  String validationKey;
  String verify;

  MailForm({Key? key, required this.validationKey, required this.verify}) : super(key: key);

  @override
  MailFormState createState() => MailFormState();
}





class MailFormState extends State<MailForm> {

  TextEditingController emailController = TextEditingController();

  final SigninController sigInController = Get.put(SigninController());
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


  postData(String email) async{
    var response = await http.post(
      Uri.parse('https://api.france-pay.fr/api/email/otp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "verify": widget.validationKey,
        'email': email,
        "type": "VERIFICATION"
      }),
    );
    print(response.body + "mail body");
    return response.body;
  }


  @override
  Widget build(BuildContext context) {


  
    Map<String, String> phoneNumber;
    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp exp = RegExp(pattern);
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
                  margin: EdgeInsets.only(left: width/4, right: width/4, top: height/10, bottom: height/10),
                  child: Image.asset("assets/images/logo-main.png"),),
                Container(
                  margin: EdgeInsets.only(left: width/6, right: width/6, bottom: 0),
                  child: Text("VEUILLEZ ENTRER VOTRE ADRESSE MAIL POUR RÉALISER VOTRE INSCRIPTION", textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width/6, right: width/6, bottom: 0, top: height/20),
                  child: Image.asset("assets/images/mailVerification.gif"),
                ),
                Container(
                    margin: EdgeInsets.only(top: height/15),
                    width: 3*width/4,
                    child: TextField(
                      controller: emailController,
                      scrollPadding:  EdgeInsets.only(bottom:40),
                      decoration: InputDecoration(
                        hintText: 'Adresse mail',
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                              color: Color(0XFF1d3364),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: height/13,

                          child: IconButton(

                              color: Colors.white,
                              icon: Icon(Icons.send),

                              onPressed: () async {

                                if (emailController.text == null || emailController.text.isEmpty) {
                                  paymentFaield("Email is empty");
                                }

                                else {
                                  setState(() {
                                    isLoading = true;
                                  });


                                  var data = await sigInController.SendOtpToEmail(widget.validationKey,emailController.text);

                                  if (data['status'] == true) {
                                    paymentSuccess(data['msg']);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ConfirmationMail( number: emailController.text, identification: data["token"], verify: widget.validationKey))
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
                                if (true) {
                                response = await postData(emailController.text);
                                Map<String, dynamic> data = json.decode(response);
                                print(emailController.text);
                                print(data["Details"]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ConfirmationMail( number: emailController.text, identification: data["Details"], verify: widget.validationKey)));
                                }else{
                                setState(() {
                                showError = true;
                                });
                                }*/
                              }
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true, //<-- SEE HERE
                        fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                      ),
                    )

                ),
              //  Container(
                  //child: Text("Vous devez saisir un numéro de téléphone valide", style: TextStyle(color: showError ? Colors.red : Colors.transparent),),
                //)
              ]
          ),
        ),
      ),
    );
  }
}




