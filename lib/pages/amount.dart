

import 'package:flutter/material.dart';
import 'package:francepay/widgets/flagAppBar.dart';

class Amount extends StatefulWidget {
  const Amount({Key? key}) : super(key: key);

  @override
  _AmountState createState() => _AmountState();
}

class _AmountState extends State<Amount> {
  @override
  Widget build(BuildContext context) {
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
                      margin: EdgeInsets.only(top: height/60, right: width/6, left: width/6),

                      child: ElevatedButton(
                        onPressed:(){}, child: Center(
                        child: Text("FrancePay website"),
                      ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(217, 217, 217, 0.5),
                        ),
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
                      margin: EdgeInsets.only(left: width/50, top: height/23),
                      alignment: Alignment.centerLeft,
                      child: Text("TO :  Rebecca MOORE"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: width/50),
                      alignment: Alignment.centerLeft,
                      child: Text("FPAY ID: 746777354@fpay"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: width/50),
                      alignment: Alignment.centerLeft,
                      child: Text("ON: 20/01/2022 at 15:00"),
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
