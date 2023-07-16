import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../Constants/Constants.dart';
import '../app/service/network_handler/networkhandler.dart';
import '../app/views/pages/CurrentTransaction.dart';

Widget TransactionsCard(double height, double width, bool credited, String name,
    String dateTime, String amount, BuildContext context, bool req) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) =>
                  // credited
                  //     ?
                  CurrentTransaction(
                    credited: credited,
                    amount: int.parse(amount).abs().toString(),
                    to: name,
                    from: "",
                  )
              // : TransactionDetail()
              ));
    },
    child: Container(
      height: height / 10,
      width: width,
      // color: Colors.red,
      child: Card(
        color: credited ? Color(0xff118C4F) : Color(0xffFA2E69),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(height * 0.017),
                    child: CircleAvatar(
                      radius: height * 0.025,
                      backgroundImage: NetworkImage(
                          "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-unknown-social-media-user-photo-default-avatar-profile-icon-vector-unknown-social-media-user-184816085.jpg"),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            req
                                ? "From: "
                                : credited
                                    ? "from: "
                                    : "to: ",
                            style: GoogleFonts.sarabun(
                                color: Colors.white70,
                                fontWeight: FontWeight.w300,
                                fontSize: height * 0.015),
                          ),
                          Text(
                            req ? name : "${name}",
                            style: GoogleFonts.sarabun(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.018),
                          ),
                        ],
                      ),
                      Text(
                        "$dateTime",
                        style: GoogleFonts.sarabun(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.016),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(height * 0.018),
              child: Container(
                alignment: Alignment.centerRight,
                width: width * 0.28,
                height: height * 0.05,
                // color: Colors.black,
                child: Text(
                  req
                      ? amount
                      : credited
                          ? "€ +$amount"
                          : "€ $amount",
                  style: GoogleFonts.sarabun(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.022),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
