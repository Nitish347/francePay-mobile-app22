

//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'createTransaction.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({Key? key}) : super(key: key);

  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  Barcode? scanData;
  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  //@override
  //void reassemble() async{
  //super.reassemble();
  //if(Platform.isAndroid)

  //}


  @override
  Widget build(BuildContext context) =>
      SafeArea(
          child: Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                buildQrView(context),
              ],
            ),
          )
      );

  Widget buildQrView(BuildContext context) =>
      QRView(
          key: qrKey,
          onQRViewCreated: onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: Theme
                .of(context)
                .accentColor,
            borderRadius: 10,
            borderLength: 20,
            borderWidth: 10,
            cutOutSize: MediaQuery
                .of(context)
                .size
                .width * 0.8,
          )
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        this.scanData = scanData;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CreateTransaction(
                      frPayId: "scanData.code")));
    }
    );
  }


}
