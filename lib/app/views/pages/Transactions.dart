import 'dart:convert';

import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:francepay/app/models/transactiondetailModel.dart';
import 'package:francepay/app/service/network_handler/networkhandler.dart';
import 'package:francepay/app/views/profile.dart';
import 'package:francepay/widgets/TransactionCard.dart';
import 'package:google_fonts/google_fonts.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  List<TransactionDetailsModel> today = [];
  List<TransactionDetailsModel> yesterday = [];
  List<TransactionDetailsModel> onemonth = [];
  List<TransactionDetailsModel> threemonth = [];
  List<TransactionDetailsModel> oneyear = [];
  List ls = ['Today', 'Yesterday', 'One Month', 'Three Months', 'One Year'];
  List mainList = [];
  String _selectedOption = 'Today';
  add() {
    for (int i = 0; i < 5; i++) {
      mainList.add(today);
      mainList.add(yesterday);
      mainList.add(onemonth);
      mainList.add(threemonth);
      mainList.add(oneyear);
    }
  }

  bool loading = false;
  todayTrans(String endpoint, List<TransactionDetailsModel> ls) async {
    setState(() {
      loading = true;
    });
    var res =
        await NetWorkHandler.get("/all_transactions?timePeriod=$endpoint");
    var data = json.decode(res);
    for (var i in data) {
      var amnt = i['amount'];
      i["destinationAccountNumber"] = "null";
      String name = '';
      try {
        if (amnt < 0) {
          var ref = i['reference'].split("transfer_to_account:");
          String walletId = ref[1];
          var data = await NetWorkHandler.postData(
              "getalldetails", {"walletId": walletId});
          name =
              data["data"][0]["firstname"] + " " + data["data"][0]["lastname"];
        } else {
          var ref = i['reference'].split("transfer_from_account:");
          String walletId = ref[1];
          var data = await NetWorkHandler.postData(
              "getalldetails", {"walletId": walletId});
          name =
              data["data"][0]["firstname"] + " " + data["data"][0]["lastname"];
        }
      } catch (e) {}

      print(name);
      i["name"] = name;
      TransactionDetailsModel transactionDetailsModel =
          TransactionDetailsModel.fromJson(i);
      ls.add(transactionDetailsModel);
      // print(transactionDetailsModel.name);
    }
    setState(() {
      loading = false;
    });
  }

  int ind = 0;
  @override
  void initState() {
    add();
    todayTrans("today", today);
    todayTrans("yesterday", yesterday);
    todayTrans("oneMonth", onemonth);
    todayTrans("threeMonths", threemonth);
    todayTrans("oneYear", oneyear);

    super.initState();
  }

  change(int num) {
    setState(() {
      ind = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  "All Transactions",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: height * 0.035),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropdownButton<String>(
                isDense: false,
                value: _selectedOption,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.black, fontSize: 16),
                onChanged: (val) {
                  setState(() {
                    ind = ls.indexOf(val.toString());
                    _selectedOption = val.toString();
                  });
                },
                items: <String>[
                  'Today',
                  'Yesterday',
                  'One Month',
                  'Three Months',
                  'One Year'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: height * 0.025),
                    ),
                  );
                }).toList(),
              ),
            ),
            // loading
            //     ? CircularProgressIndicator()
            //     :
            loading
                ? Center(child: CircularProgressIndicator())
                : mainList[ind].length == 0
                    ? Center(
                        child: Text("No Transactions"),
                      )
                    : Column(
                        children: List.generate(mainList[ind].length, (index) {
                          return TransactionsCard(
                              height,
                              width,
                              true,
                              mainList[ind][index].name!,
                              mainList[ind][index].createdAt.toString(),
                              mainList[ind][index].amount.toString(),
                              context,
                              false);
                        }),
                      ),

            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Text(
            //     "Yesterday",
            //     style: GoogleFonts.poppins(
            //         fontWeight: FontWeight.w400, fontSize: height * 0.025),
            //   ),
            // ),
            // loading
            //     ? Center(child: CircularProgressIndicator())
            //     : yesterday.length == 0
            //         ? Center(
            //             child: Text("No Transactions"),
            //           )
            //         : Column(
            //             children: List.generate(yesterday.length, (index) {
            //               return TransactionsCard(
            //                   height,
            //                   width,
            //                   true,
            //                   yesterday[index].name!,
            //                   yesterday[index].createdAt.toString(),
            //                   yesterday[index].amount.toString(),
            //                   context,
            //                   false);
            //             }),
            //           ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Text(
            //     "One Month ago",
            //     style: GoogleFonts.poppins(
            //         fontWeight: FontWeight.w400, fontSize: height * 0.025),
            //   ),
            // ),
            // loading
            //     ? Center(child: CircularProgressIndicator())
            //     : onemonth.length == 0
            //         ? Center(
            //             child: Text("No Transactions"),
            //           )
            //         : Column(
            //             children: List.generate(onemonth.length, (index) {
            //               return TransactionsCard(
            //                   height,
            //                   width,
            //                   true,
            //                   onemonth[index].name!,
            //                   onemonth[index].createdAt.toString(),
            //                   onemonth[index].amount.toString(),
            //                   context,
            //                   false);
            //             }),
            //           ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Text(
            //     "Three Month ago",
            //     style: GoogleFonts.poppins(
            //         fontWeight: FontWeight.w400, fontSize: height * 0.025),
            //   ),
            // ),
            // Column(
            //   children: List.generate(threemonth.length, (index) {
            //     return TransactionsCard(
            //         height,
            //         width,
            //         true,
            //         threemonth[index].name!,
            //         threemonth[index].createdAt.toString(),
            //         threemonth[index].amount.toString(),
            //         context,
            //         false);
            //   }),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Text(
            //     "One Year ago",
            //     style: GoogleFonts.poppins(
            //         fontWeight: FontWeight.w400, fontSize: height * 0.025),
            //   ),
            // ),
            // loading
            //     ? Center(child: CircularProgressIndicator())
            //     : today.length == 0
            //         ? Center(
            //             child: Text("No Transactions"),
            //           )
            //         : Column(
            //             children: List.generate(threemonth.length, (index) {
            //               return TransactionsCard(
            //                   height,
            //                   width,
            //                   true,
            //                   threemonth[index].name!,
            //                   threemonth[index].createdAt.toString(),
            //                   threemonth[index].amount.toString(),
            //                   context,
            //                   false);
            //             }),
            //           )

            // Positioned(
            //     top: 160,
            //     child: Container(
            //         decoration: BoxDecoration(
            //             color: Color(0xffF5F5F5),
            //             borderRadius: BorderRadius.only(
            //                 topLeft: Radius.circular(10),
            //                 topRight: Radius.circular(10))),
            //         width: width,
            //         height: height * 0.75,
            //         child: Padding(
            //             padding: const EdgeInsets.all(10.0),
            //             child: DefaultTabController(
            //                 length: 3,
            //                 child: Column(
            //                   children: [
            //                     Container(
            //                       child: SegmentedTabControl(
            //                         radius: Radius.circular(20),
            //                         backgroundColor: Colors.white,
            //                         indicatorColor: Color(0xff204394),
            //                         tabTextColor: Colors.black,
            //                         squeezeIntensity: 2,
            //                         height: 40,
            //                         textStyle: GoogleFonts.poppins(
            //                             fontWeight: FontWeight.w500,
            //                             fontSize: 15),
            //                         tabPadding:
            //                             EdgeInsets.symmetric(horizontal: 8),
            //                         tabs: [
            //                           SegmentTab(
            //                             label: "All Trasactions",
            //                             textColor: Color(0xff204394),
            //                           ),
            //                           SegmentTab(
            //                             label: "Bank",
            //                             textColor: Color(0xff204394),
            //                           ),
            //                           SegmentTab(
            //                             label: "Card",
            //                             textColor: Color(0xff204394),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                     SizedBox(
            //                       height: 30,
            //                     ),
            //                     Container(
            //                       height: height - 300,
            //                       child: TabBarView(
            //                         physics: BouncingScrollPhysics(),
            //                         children: [
            //                           Center(
            //                             child: Text("kjsvjjs"),
            //                           ),
            //                           Center(
            //                             child: Text("kjsvjjs"),
            //                           ),
            //                           Center(
            //                             child: Text("gfd"),
            //                           ),
            //                         ],
            //                       ),
            //                     )
            //                   ],
            //                 ))))),
          ],
        ),
      ),
    );
  }
}
//
// class DropdownMenuWidget extends StatefulWidget {
//   @override
//   _DropdownMenuWidgetState createState() => _DropdownMenuWidgetState();
// }
//
// class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
//   String _selectedOption = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedOption = 'Today';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     return DropdownButton<String>(
//       isDense: false,
//       value: _selectedOption,
//       icon: Icon(Icons.arrow_drop_down),
//       iconSize: 24,
//       elevation: 16,
//       style: TextStyle(color: Colors.black, fontSize: 16),
//       onChanged: (val) {
//         setState(() {
//           print(ls.indexOf(val.toString()));
//           _selectedOption = val.toString();
//         });
//       },
//       items: <String>[
//         'Today',
//         'Yesterday',
//         'One Month',
//         'Three Months',
//         'One Year'
//       ].map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(
//             value,
//             style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.w400, fontSize: height * 0.025),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
