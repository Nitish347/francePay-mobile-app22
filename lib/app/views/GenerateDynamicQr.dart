import 'package:flutter/material.dart';
import 'package:francepay/widgets/flagAppBar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DynamicQrCode extends StatelessWidget {
  String id;
  String amount;

  DynamicQrCode({Key? key, required this.amount, required this.id})
      : super(key: key);
  final GlobalKey globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FlagAppBar(),
      SizedBox(
        height: 200,
      ),
      Container(
        decoration: BoxDecoration(border: Border.all(color: Color(0XFF1d3364))),
        // child: Card(
        child: RepaintBoundary(
          key: globalKey,
          child: QrImage(
            data: "${id}?${amount}",
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
        //),
      ),
    ]);
  }
}
