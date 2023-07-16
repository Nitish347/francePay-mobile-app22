import 'package:flutter/material.dart';
import 'package:francepay/app/controllers/account_controller.dart';
import 'package:francepay/app/service/network_handler/networkhandler.dart';
import 'package:francepay/app/views/addFriends.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../Constants/Constants.dart';
import '../../widgets/logo.dart';
import '../obsData.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<String> contacts = [
    'Maximilien Sadky',
    'Jad Hariri',
    'Antoine Le Duc',
    'Marie Dupont',
  ];

  List<String> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    filteredContacts = contacts;
  }

  void filterContacts(String query) {
    setState(() {
      filteredContacts = contacts
          .where(
              (contact) => contact.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  showDataAlert(double height, double widht) {
    bool sent = false;
    ObsData controller = Get.put(ObsData());
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
              ),
              contentPadding: EdgeInsets.only(
                top: 10.0,
              ),
              content: AddFriends());
        });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Logo(height * 0.7),
              // Padding(
              //   padding: EdgeInsets.only(left: width * 0.012),
              //   child: Container(
              //     alignment: Alignment.centerLeft,
              //     child: Text(
              //       "My Profil",
              //       style: TextStyle(
              //           fontFamily: "sarabun",
              //           fontSize: height * 0.023,
              //           color: blueColor,
              //           fontWeight: FontWeight.w500),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 5,
              // ),
              // Container(
              //   height: height / 11.5,
              //   width: width,
              //   child: Card(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8.0),
              //     ),
              //     elevation: 1,
              //     child: Center(
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           SizedBox(
              //             width: 20,
              //           ),
              //           CircleAvatar(),
              //           SizedBox(
              //             width: 20,
              //           ),
              //           Text(
              //             "Praveen Soni",
              //             textAlign: TextAlign.center,
              //             style: GoogleFonts.poppins(
              //                 color: Colors.black, fontSize: height * 0.022),
              //           ),
              //         ],
              //       ),
              //     ),
              //
              //     //child: Text(accountController.balance.value.toString(), textAlign: TextAlign.center, style: TextStyle(color: Color(0XFF118C4F), fontWeight: FontWeight.w600, fontFamily: "sarabun", fontSize: 20),),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 5,
                child: Center(
                  child: TextField(
                    onChanged: filterContacts,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search_sharp),
                        hintText: 'Search friends, Fpay ID...',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.grey)),
                  ),
                ),

                //child: Text(accountController.balance.value.toString(), textAlign: TextAlign.center, style: TextStyle(color: Color(0XFF118C4F), fontWeight: FontWeight.w600, fontFamily: "sarabun", fontSize: 20),),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.012),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "My Friends",
                        style: GoogleFonts.poppins(
                            fontSize: height * 0.025,
                            color: blueColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDataAlert(height, width);
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: blueColor,
                            ),
                            Icon(
                              Icons.person,
                              color: blueColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Add Friend",
                              style: GoogleFonts.poppins(
                                  fontSize: height * 0.025,
                                  color: blueColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                height: 5,
                color: Colors.black45,
              ),
              Expanded(
                child: ListView(
                  children: List.generate(filteredContacts.length, (index) {
                    return FriendGrid(filteredContacts[index]);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget FriendGrid(String name) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: blueColor,
        child: Icon(Icons.person),
      ),
      title: Text(
        name,
        style: GoogleFonts.poppins(fontSize: 16),
      ),
    ),
  );
}
