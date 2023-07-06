import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../Constants/Constants.dart';
import '../../widgets/logo.dart';
import '../service/network_handler/networkhandler.dart';

class AddFriends extends StatefulWidget {
  @override
  _AddFriendsState createState() => _AddFriendsState();
}

class _AddFriendsState extends State<AddFriends> {
  bool isPopupVisible = false;
  TextEditingController textFieldController = TextEditingController();

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  void togglePopupVisibility() {
    setState(() {
      isPopupVisible = !isPopupVisible;
    });
  }

  bool idFound = false;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController msg = TextEditingController();
  String name = "";
  bool stopAction = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.8,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Logo(height * 0.5),
            SizedBox(
              height: height * 0.035,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     "Fpay-Id  ",
            //   ),
            // ),
            Container(
              height: height / 15,
              width: width,

              //color: Colors.red,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: width * 0.7,
                        child: TextFormField(
                          controller: textEditingController,
                          readOnly: idFound,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: height * 0.022,
                              color: Colors.green),
                          cursorHeight: height * 0.023,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.perm_identity_rounded),
                              hintText: " Enter F-Pay ID",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.grey)),
                        ),
                      ),
                    ),
                    Container(
                      // width: width * 0.1,
                      child: InkWell(
                        onTap: () async {
                          var data = await NetWorkHandler.postData(
                              "getalldetails",
                              {"walletId": textEditingController.text});
                          String nameData = data["data"][0]["merchant_name"];
                          print(nameData);
                          // print(data.toString());
                          setState(() {
                            idFound = true;
                            isPopupVisible = false;
                            name = nameData;
                          });
                        },
                        child: Text(
                          "Verify",
                          style: GoogleFonts.poppins(
                              fontSize: height * 0.02, color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
            ),
            idFound
                ? Container(
                    width: width,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.poppins(
                              fontSize: height * 0.02,
                              color: Color(0XFF1d3364)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(height * 0.01),
                          child: CircleAvatar(
                              radius: height * 0.03,
                              backgroundImage: AssetImage(
                                  'assets/images/photoIdentite.jpg')),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                idFound = false;
                                isPopupVisible = false;
                                // textEditingController.clear();
                              });
                            },
                            icon: Icon(Icons.cancel_outlined))
                      ],
                    ),
                  )
                : Container(),

            SizedBox(
              height: height * 0.035,
            ),
            InkWell(
              onTap: () {
                if (idFound && !isPopupVisible) togglePopupVisibility();
                // print(sent);
              },
              child: Container(
                alignment: Alignment.center,
                height: height * 0.06,
                decoration: BoxDecoration(
                    color: idFound ? blueColor : Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Send Request",
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.018, color: Colors.white),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isPopupVisible,
              child: Lottie.asset("assets/lotties/sent.json",
                  height: height * 0.3),
            )
          ],
        ),
      ),
    );
  }
}
