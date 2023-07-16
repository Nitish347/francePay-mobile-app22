import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:francepay/app/views/pages/CurrentTransaction.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../EnterAmount.dart';
import '../pages/PinPage.dart';

class QRScanner {
  static Future qrScanner(BuildContext context) async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.QR,
      );

      print(qrCode);
      ContainsAmount(qrCode, context);
    } on PlatformException {
      print("object");
    }
  }

  static List<String> separateStrings(
      String inputString, BuildContext context) {
    List<String> parts = inputString.split('?');
    if (parts.length == 2) {
      String wallet = parts[0];
      String id = parts[1];
      print("Wallet: $wallet");
      print("ID: $id");
      return parts;
    } else {
      print(
          "Invalid input format. Please provide input in the format 'wallet?id'.");
    }
    return [];
  }

  static void ContainsAmount(String input, BuildContext context) {
    if (input.contains("?")) {
      print("yes");
      List ls = separateStrings(input, context);
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
              builder: (context) => PinPage(
                    balance: false,
                    amount: ls[1],
                    id: ls[0],
                  )));
    } else {
      print("no");
      Get.to(() => EnterAmount(
            id: input,
            generate: false,
          ));
      // Navigator.push(
      //     context, CupertinoPageRoute(builder: (context) => EnterAmount(id: input,)));
    }
  }

  bool PinCorrect(String pin) {
    if (pin == "123456") {
      return true;
    }
    return false;
  }
}
