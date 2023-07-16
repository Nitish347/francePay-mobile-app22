import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Constants/Constants.dart';

Widget FriendReqCard(
    double width,
    double heigth,
    String title,
    String buttonText,
    String id,
    String svgPath,
    Color color,
    String value,
    String date) {
  return Padding(
    padding: EdgeInsets.only(top: heigth * 0.015, left: 5, right: 5),
    child: Container(
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xffDEDEDE),
            boxShadow: shadow),
        child: Padding(
          padding: EdgeInsets.all(heigth * 0.016),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // height: heigth * 0.07,
                      child: CircleAvatar(
                        radius: heigth * 0.03,
                        backgroundImage:
                            AssetImage("assets/images/photoIdentite.jpg"),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.poppins(
                                  color: Color(0xff25262C),
                                  fontSize: heigth * 0.019),
                            ),
                          ],
                        ),
                        Text(
                          "$id@fpay",
                          style: TextStyle(
                              color: Color(0xff25262C),
                              fontSize: heigth * 0.015),
                        ),
                        Text(
                          DateFormat('dd/MM/yy').format(DateTime.parse(date)),
                          style: TextStyle(
                              color: Color(0xff25262C),
                              fontSize: heigth * 0.018),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: heigth * 0.035,
                        width: heigth * 0.11,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Reject",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: heigth * 0.016,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: heigth * 0.035,
                        width: heigth * 0.11,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Accept",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: heigth * 0.016,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )),
  );
}
