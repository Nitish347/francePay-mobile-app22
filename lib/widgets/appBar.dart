import 'package:flutter/material.dart';
import 'package:francepay/app/views/request_screen.dart';

import '../Constants/Constants.dart';

AppBar FpayAppBar(double height, BuildContext context) {
  return AppBar(
      iconTheme: IconThemeData(color: blueColor),
      centerTitle: true,
      title: Image.asset("assets/images/logo-only.png", height: height * 0.18),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.comment,
          ),
          tooltip: 'Comment Icon',
          onPressed: () {},
        ), //IconButton
        IconButton(
          icon: Icon(
            Icons.notifications,
          ),
          tooltip: 'Setting Icon',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RequestScreen()));
          },
        ), //IconButton
      ],
      backgroundColor: Colors.white);
}
