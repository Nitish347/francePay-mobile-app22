import 'dart:convert';
import 'package:francepay/app/views/common/bottomnavbar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:francepay/app/controllers/transfer_controller.dart';
import 'package:francepay/widgets/nextButton.dart';
import 'package:quickalert/quickalert.dart';
import 'package:francepay/app/views/pages/success.dart';

class CreateTransaction extends StatefulWidget {

 // CreateTransaction({Key? key, this.frPayId = ""}) : super(key: key);

  @override
  CreateTransactionState createState() => CreateTransactionState();
}

class CreateTransactionState extends State<CreateTransaction> {

  final transferController = Get.put(TransferController());


  bool isLoading = false;


 final String frPayId = Get.arguments?? "";






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

  @override
  Widget build(BuildContext context) {

    TextEditingController amountController = TextEditingController(text : null);
    TextEditingController walletidController = TextEditingController(text : null);

    //saving form after validation
    if(frPayId != null){

      walletidController.text = frPayId;
    }
    else{

      walletidController.text = "";
    }


    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return Scaffold(
      body: SingleChildScrollView(
          child: isLoading
              ?
          Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            child:  const Center(
              child: CircularProgressIndicator(),
            ),

          )
              :
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: width/4, right: width/4, top: height/20, bottom: height/20),
                child: Image.asset("assets/images/logo-main.png"),),
              //Center(child: Text("Veuillez entrer les données de la transaction"),),
              Container(
                margin: EdgeInsets.only(right: 3*width/4),
                child: const Text(
                  "Solde",
                  style: TextStyle(fontFamily: "sarabun", color: Color(0XFF757F8C), fontWeight: FontWeight.w500),
                ),
              ),
      ///Obx( () =>
              Container(
                  height: height/10,
                  width: width/1.1,
                  //color: Colors.red,
                  child: Card(
                    child: Center(
                      child: FutureBuilder(
                        future: transferController.GetWalletBalance(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text('${snapshot.data}', textAlign: TextAlign.center, style: TextStyle(color: Color(0XFF118C4F), fontWeight: FontWeight.w600, fontFamily: "sarabun", fontSize: 20),);
                          } else {
                            print("This works...");
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    //  child: Text("€ "+transferController.balance.value.toString(), textAlign: TextAlign.center, style: TextStyle(color: Color(0XFF118C4F), fontWeight: FontWeight.w600, fontFamily: "sarabun", fontSize: 20),),
                    ),
                  )
              ),
    //  ),
              Container(
                margin: EdgeInsets.only(left: width/14, top: height/50),
                child: Row(
                  children: [
                    Image.asset("assets/images/receive.png", scale: 30),
                    Container(

                        margin: EdgeInsets.only(left: width/100),
                        child: Text("Id destinataire",
                          style: TextStyle(color: Color(0XFF757F8C),
                              fontWeight: FontWeight.w500, fontSize: 12),))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                child: TextFormField(
                  controller: walletidController,
                  scrollPadding: EdgeInsets.only(bottom:40),
                  decoration: InputDecoration(
                    hintText: 'Fpay ID',
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
                    Image.asset("assets/images/money 1.png", scale: 30),
                    Container(
                        margin: EdgeInsets.only(left: width/100),
                        child: Text("Montant",
                          style: TextStyle(color: Color(0XFF757F8C),
                              fontWeight: FontWeight.w500, fontSize: 12),))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                child: TextFormField(

                  controller: amountController,
                  scrollPadding:  EdgeInsets.only(bottom:40),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    hintText: '0.00 €',

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
                    Image.asset("assets/images/comment.png", scale: 30),
                    Container(
                        margin: EdgeInsets.only(left: width/100),
                        child: Text("Message",
                          style: TextStyle(color: Color(0XFF757F8C),
                              fontWeight: FontWeight.w500, fontSize: 12),))
                  ],
                ),
              ),
              Container(
                height: height/5,
                margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                child: TextFormField(

                  maxLines: 5,
                  scrollPadding:  EdgeInsets.only(bottom:40),
                  decoration: InputDecoration(
                    //hintText: '...',
                    //hintStyle: TextStyle(),
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
                margin: EdgeInsets.only(bottom: height/10, top: height/12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    //NextButton(buttonColor: Color(0XFF000000), text: "Passer", nextPage: CongratulationPage(),),
                        SizedBox(
                          width: width/4,
                          height: height/20,
                          child: ElevatedButton(   onPressed: () async {
                            if (walletidController.text == null || walletidController.text.isEmpty) {
                              paymentFaield("Fpay id is empty");
                            }

                            else if (amountController.text == null || amountController.text.isEmpty){
                              paymentFaield("Amount is empty");
                            }

                            else {
                              setState(() {
                                isLoading = true;
                              });
                              // await Future.delayed(Duration(seconds: 4));
                              var data = await transferController.TransferFund(
                                  amountController.text, walletidController.text);

                              if (data['status'] == true) {



                                //getx send data to next page

                             //   Get.toNamed("/transfer", arguments: scanData.code);

                                Get.toNamed("/tran_msg", arguments: data["data"]);


                               /* Get.to(TransactionDetails(), arguments: {
                                  'amount': amountController.text,
                                  'walletid': data["transaction"]["accountNumber"],
                                  'transactionid': data["transaction"]["id"],
                                  'status': "success",
                                  'message': "Transaction successful",
                                  'date': data["transaction"]["createdAt"],
                                });*/


                                paymentSuccess(data['msg']);
                                // walletidController.clear();
                                //amountController.clear();

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
                          },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),

                                  )
                              ),
                              backgroundColor:  MaterialStateProperty.all(Color(0XFFED2939)),
                            ),
                            child: Text("Send Payment"),
                          ),
                        ),
                    NextButton(buttonColor: Color(0XFF1d3364), text: "My payments", nextPage: "/my_payment"),
                    NextButton(buttonColor: Color(0XFF000000), text: "Quitter",nextPage: "/account" ),


                  /* ElevatedButton(
                    child: const Text('Quitter'),
                   onPressed: () async {
                      if (walletidController.text == null || walletidController.text.isEmpty) {
                        paymentFaield("Fpay id is empty");
                      }

                      else if (amountController.text == null || amountController.text.isEmpty){
                        paymentFaield("Amount is empty");
                      }

                      else {
                        setState(() {
                          isLoading = true;
                        });
                        // await Future.delayed(Duration(seconds: 4));
                        var data = await transferController.TransferFund(
                            amountController.text, walletidController.text);

                        if (data['status'] == true) {
                          paymentSuccess(data['msg']);
                         // walletidController.clear();
                          //amountController.clear();

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
                    },
                   ),*/


                   // NextButton(buttonColor: Color(0XFF1d3364), text: "Suivant", nextPage: NewPayment(),),
                  ],
                ),
              )
            ]
        ),
      ),
      bottomNavigationBar: NavBar(index: 3),
    );
  }
}
