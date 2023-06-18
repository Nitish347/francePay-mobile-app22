// import 'package:flutter/material.dart';
//
// Widget TransactionCard(double height, double width, String img, String refence,
//     String formatedDate) {
//   return Card(
//     //green
//     color: Color(0xFF118C4F),
//     child: Container(
//         child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           margin: EdgeInsets.only(left: width / 100),
//           child: CircleAvatar(
//             backgroundImage: AssetImage("assets/images/photoIdentite.jpg"),
//             radius: 20,
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(left: width / 50, top: height / 70),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 refence,
//                 style: TextStyle(color: Colors.white),
//               ),
//               Container(
//                   //margin: EdgeInsets.only(left: width/27),
//                   child: Text(formatedDate,
//                       style: TextStyle(color: Colors.white))),
//             ],
//           ),
//         ),
//         Container(
//             margin: EdgeInsets.only(left: width / 2.5),
//             child: Text("snapshot.data[index]['amount']",
//                 style: TextStyle(color: Colors.white))),
//       ],
//     )),
//   );
// }
