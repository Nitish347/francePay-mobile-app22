

import 'package:flutter/material.dart';
import 'package:francepay/widgets/flagAppBar.dart';
import 'package:get/get.dart';

class TransactionDetails extends StatefulWidget {
  const TransactionDetails({Key? key}) : super(key: key);

  //get paramter from previous page gtx



  @override
  _TransactionDetailsState createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {

  @override
  Widget build(BuildContext context) {


    var data = Get.arguments;
    print(data);
/*
    print(data[0]['amount']);
    print(data[1]['walletid']);
    print(data[2]['transactionid']);
    print(data[3]['date']);*/

    print(data);


    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FlagAppBar(),
            Container(
              margin: EdgeInsets.only(top: height/15),
              child: Image.asset("assets/images/logo-main.png", scale: 30,),
            ),
            Container(
              margin: EdgeInsets.only(top: height/15, bottom:  height/40),
              child: Text("TRANSACTION DETAILS", style: TextStyle(fontFamily: "sarabun", fontSize: 20, fontWeight:  FontWeight.w500),),

            ),
            Container(
              height: height/3,
              width: width/1.3,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Color(0XFF204394),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: height/100),
                      child: Text("Paid Successfully", style:  TextStyle(fontFamily: "sarabun", color: Colors.white, fontSize: 20),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height/11),
                      child: Text("72.00 €", style:  TextStyle(fontFamily: "sarabun", color: Colors.white, fontSize: 40),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height/60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed:(){}, child: Row(
                            children: [
                              Text("Comment"),
                            ],
                          ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(217, 217, 217, 0.5),
                            ),
                          ),
                          ElevatedButton(onPressed:(){}, child: Row(
                            children: [
                              Text("Share"),
                            ],
                          )),
                          ElevatedButton(onPressed:(){}, child: Row(
                            children: [
                              Text("Repeat"),
                            ],
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height/30),
              height: height/6,
              width: width/1.3,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: width/50, top: height/50),
                      alignment: Alignment.centerLeft,
                      child: Text("FROM Praveen SONI"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: width/50),
                      alignment: Alignment.centerLeft,
                      child: Text("FPAY ID: 746777354@fpay"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.black, width: 3.0)),
                      ),
                      margin: EdgeInsets.only(left: width/50, top: height/40),
                      alignment: Alignment.centerLeft,
                      child: Text("TO :  Rebecca MOORE"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: width/50),
                      alignment: Alignment.centerLeft,
                      child: Text("FPAY ID: 746777354@fpay"),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

