import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:francepay/app/controllers/transfer_controller.dart';
import 'package:francepay/pages/mainMenu.dart';
import 'package:francepay/widgets/nextButton.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:francepay/widgets/flagAppBar.dart';
import 'package:quickalert/quickalert.dart';

class CardForm extends StatefulWidget {
  CardForm({Key? key}) : super(key: key);

  @override
  _CardFormState createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  @override

  final transferController = Get.put(TransferController());

  TextEditingController cardnoController = TextEditingController(text : null);
  TextEditingController cardNameController = TextEditingController(text : null);
  TextEditingController expdateController = TextEditingController(text : null);
  TextEditingController cvcController = TextEditingController(text : null);

  bool isLoading = false;



  Widget build(BuildContext context) {

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

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: isLoading ?
        Container(
          height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child:  const Center(
        child: CircularProgressIndicator(),
      ),

    )
        : Column(
          children: [
            const FlagAppBar(),
            Container(
              margin: EdgeInsets.only(left: width/4, right: width/4, top: height/20, bottom: height/20),
              child: Image.asset("assets/images/logo-main.png"),),
            Form(
              child: Column(
                children: [
                  Container(
                    child: Text("VEUILLEZ ENTRER VOS DONNEES", style: TextStyle(fontSize: 20, fontFamily: "sarabun", fontWeight: FontWeight.w500),),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: width/15, right: width/15, top: height/30),
                      child: Image.asset("assets/images/cardCompany.png")
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width/14, top: height/50),
                    child: Row(
                      children: [
                        Image.asset("assets/images/cardHand.png", scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width/100),
                            child: Text("Numéro",
                              style: TextStyle(color: Color(0XFF757F8C),
                                  fontWeight: FontWeight.w500, fontSize: 12),))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                    child: TextFormField(
                      controller: cardnoController,
                      scrollPadding:  EdgeInsets.only(bottom:40),
                      decoration: InputDecoration(
                        hintText: 'Numéro de carte',

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
                    margin: EdgeInsets.only(left: width/14, top: height/50),
                    child: Row(
                      children: [
                        Image.asset("assets/images/nameOffice.png", scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width/100),
                            child: Text("Nom",
                              style: TextStyle(color: Color(0XFF757F8C),
                                  fontWeight: FontWeight.w500, fontSize: 12),))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                    child: TextFormField(
                      // Only numbers can be entered
                      controller: cardNameController,
                      scrollPadding:  EdgeInsets.only(bottom:40),
                      decoration: InputDecoration(
                        hintText: 'Nom du propriétaire',

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
                    margin: EdgeInsets.only(left: width/14, top: height/50),
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Image.asset("assets/images/calendar.png", scale: 30),
                              Container(
                                  margin: EdgeInsets.only(left: width/100),
                                  child: Text("Date d'expiration",
                                    style: TextStyle(color: Color(0XFF757F8C),
                                        fontWeight: FontWeight.w500, fontSize: 12),))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: width/5.7),
                          child: Row(
                            children: [
                              Image.asset("assets/images/calendar.png", scale: 30),
                              Container(
                                  margin: EdgeInsets.only(left: width/100),
                                  child: Text("Date d'expiration",
                                    style: TextStyle(color: Color(0XFF757F8C),
                                        fontWeight: FontWeight.w500, fontSize: 12),))
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: width/14, top: height/300),
                          width: width/2.5,
                          child: TextFormField(
                            controller: expdateController,
                            scrollPadding:  EdgeInsets.only(bottom:40),
                            decoration: InputDecoration(
                                hintText: 'Date',

                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true, //<-- SEE HERE
                                fillColor: Color.fromRGBO(207, 203, 185, 0.6)),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: height/300),
                            width: width/2.5,
                            child: TextFormField(
                              controller: cvcController,
                              scrollPadding:  EdgeInsets.only(bottom:40),
                              decoration: InputDecoration(
                                  hintText: 'CVC',

                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true, //<-- SEE HERE
                                  fillColor: Color.fromRGBO(207, 203, 185, 0.6)),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height/20),
                    child: SizedBox(
                      width: width/4,
                      height: height/20,
                      child: ElevatedButton(   onPressed: () async {
                        if (cardnoController.text == null || cardnoController.text.isEmpty) {
                              paymentFaield("Fpay id is empty");
                            }

                            else if (cardNameController.text == null || cardNameController.text.isEmpty){
                              paymentFaield("Amount is empty");
                            }

                            else if (expdateController.text == null || expdateController.text.isEmpty){
                              paymentFaield("Expire date");
                            }

                            else if (cvcController.text == null || cvcController.text.isEmpty){
                              paymentFaield("cvc is empty");
                            }

                            else {
                              setState(() {
                                isLoading = true;
                              });
                              // await Future.delayed(Duration(seconds: 4));
                              //
                              var data = await transferController.Card_Reg();

                              print(data);
                              var Id = data["data"]["Id"];
                              print("Id "+Id);

                              if (data['status'] == true) {
                                print(data['msg']);
                                var accesskey = data["data"]["AccessKey"];
                                var preregdata = data["data"]["PreregistrationData"];
                                var cardnumber = cardnoController.text;
                                var cardname = cardNameController.text;
                                var expdate = expdateController.text;
                                var cvc = cvcController.text;

                                var card_reg_data = await transferController
                                    .Card_Reg_Third_Token(
                                    accesskey, preregdata, cardnumber, expdate,
                                    cvc);
                                print(card_reg_data);
                                if (card_reg_data["status"] == true) {
                                  var card_reg = await transferController
                                      .Card_Reg_by_Id(
                                      Id, card_reg_data['data']);
                                  print(card_reg);

                                  if (card_reg_data["status"] == true) {
                                    paymentSuccess(data['msg']);
                                  }
                                  else {
                                    paymentFaield(data['msg']);
                                  }
                                }
                                else {
                                  paymentFaield(data['msg']);
                                }
                              }

                              else {
                                paymentFaield(data['msg']);
                              }

                              setState(() {
                                isLoading = false;
                              });

                            }
                      },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),

                              )
                          ),
                          backgroundColor:  MaterialStateProperty.all(Color(0XFF1d3364)),
                        ),
                        child: Text("Valider"),
                      ),
                    ),
                    //child: NextButton(buttonColor: Color(0XFF1d3364), text: "Suivant", nextPage: MainMenu())
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
