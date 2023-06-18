import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar extends StatefulWidget {
  var index;

  NavBar({Key? key, this.index}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {


  @override
  Widget build(BuildContext context) {

    return  BottomNavigationBar(
    fixedColor: Color(0XFF1d3364),
    //backgroundColor: Color(0XFF1d3364),
    showUnselectedLabels: true,
    currentIndex: widget.index,
    type: BottomNavigationBarType.fixed,
    elevation: 10.0,
    items: [
    BottomNavigationBarItem(
    icon: Icon(Icons.home, color: widget.index == 0 ? Color(0XFF1d3364) : Colors.grey),
    label: "Accueil",
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.wallet, color: widget.index == 1 ? Color(0XFF1d3364) : Colors.grey),
    label: "Transfert",
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.qr_code_scanner, color: widget.index == 2 ? Color(0XFF1d3364) : Colors.grey),
    label: "Scanner",
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.euro_symbol, color: widget.index == 3 ? Color(0XFF1d3364) : Colors.grey),
    label: "Paiements",
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.person, color: widget.index == 4 ? Color(0XFF1d3364) : Colors.grey),
    label: "Profile",

    )
    ],
    onTap: (currentIndex){
    switch(currentIndex) {

    case 0: {
      setState(){
        currentIndex = 0;
      }
    currentIndex = 0;
    Get.toNamed("/account");
    }
    break;

    case 1: {
      setState(){
        currentIndex = 1;
      }
      Get.toNamed("/add_money");


   /* Navigator.of(context).push(
    MaterialPageRoute(
    builder: (context) => Gerer()));
    */
    }
    break;


    case 2: {
      setState(){
        currentIndex = 2;
      }
      Get.toNamed("/qr_page");
   /* Navigator.of(context).push(
    MaterialPageRoute(
    builder: (context) => QRScanPage()));*/
    }
    break;
    case 3: {
      setState(){
        currentIndex = 3;
      }
      Get.toNamed('/payments');
    // loading = false;
    //Navigator.of(context).push(
    //  MaterialPageRoute(
    //    builder: (context) => Messagerie(userId: userId,)));
    }
    break;
    case 4: {
      setState(){
        currentIndex = 4;
      }
      Get.toNamed("/profile");
      /*
    Navigator.of(context).push(
    MaterialPageRoute( builder: (context) => Profil()));*/
    }
    break;
    }
    }
    );

  }
}