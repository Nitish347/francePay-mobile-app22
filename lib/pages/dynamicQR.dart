import 'package:flutter/material.dart';
import 'package:francepay/app/views/common/bottomnavbar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DynamicQR extends StatefulWidget {
  var amount;
  DynamicQR({Key? key, required this.amount}) : super(key: key);

  @override
  _DynamicQRState createState() => _DynamicQRState();
}

class _DynamicQRState extends State<DynamicQR> {
  @override


  Widget build(BuildContext context) {

    final GlobalKey globalKey = GlobalKey();

    var qr = QrImage(
      data: "787314480@FPAY" + widget.amount,
      version: QrVersions.auto,
      size: 200.0,
    );

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.comment),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: Icon(Icons.notifications),
            tooltip: 'Setting Icon',
            onPressed: () {},
          ), //IconButton
        ], //<Wi
        backgroundColor: Color(0XFF1d3364),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height/10,
              margin: EdgeInsets.only(top: height/50, bottom: height/50, left: width/20, right: width/20),
              child:Image.asset("assets/images/logo-main.png", scale: 40,),
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: width/10, top: height/50, bottom: height/50, left: height/50),
                    height: height/10,
                    width: height/10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/restaurant.png'),
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: height/40),
                          child: Row(
                            children: [
                              Container(

                                margin: EdgeInsets.only(right: width/30),
                                child: Image.asset("assets/images/name.png", scale: 20,),
                              ),
                              Container(
                                child: Text("Mon restaurant"),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: width/30),
                                child: Text("FPAY ID ", style: TextStyle(color: Color(0XFF1d3364), fontSize: 10, fontWeight: FontWeight.bold),)
                            ),
                            Container(
                              child: Text("787314480@FPAY"),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
                height: height/10,
                width: width/1.1,
                //color: Colors.red,
                child: Card(
                  child: Center(
                    child: Text(widget.amount + " € à Mon restaurant", textAlign: TextAlign.center, style: TextStyle(color: Color(0XFF204394), fontFamily: "sarabun", fontSize: 20),),
                  ),
                )
            ),
            Container(
              margin: EdgeInsets.only(top: height/10),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0XFF1d3364))
              ),
              // child: Card(
              child: RepaintBoundary(
                key: globalKey,
                child: QrImage(
                  data: "787314480@FPAY",
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
              //),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: height/20, left: width/10, right: width/10),
              child: Text("Veuillez scanner ce QR code afin de valider le paiement", textAlign: TextAlign.center,),
            ),
            Container(
                margin: EdgeInsets.only(top: height/10),
                width: width/3,
                child: ElevatedButton(onPressed: () async {
                  //await Share.share("Hello 787314480@FPAY is my France pay ID");
                },

                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFFCED2D9)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),

                          )
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(child: Icon(Icons.share, size: 30, color: Colors.black,)),
                      Container(child: Text("Partager QR", style: TextStyle(fontSize: 10, color: Colors.black),),),
                    ],
                  ),

                )
            )
          ],
        ),
      ),
      bottomNavigationBar: NavBar(index: 2),
    );
  }
}
