import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:francepay/pages/mainMenu.dart';
import 'package:francepay/pages/profil.dart';

import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../app/scanner.dart';
import '../app/views/account_home.dart';
import '../app/views/pages/Transactions.dart';
import '../app/views/profile.dart';
import '../pages/gerer.dart';
import '../pages/qrScanPage.dart';
import 'appBar.dart';
import 'navigationDrawerWidget.dart';

class AnimatedBarExample extends StatefulWidget {
  const AnimatedBarExample({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedBarExample> createState() => _AnimatedBarExampleState();
}

class _AnimatedBarExampleState extends State<AnimatedBarExample> {
  dynamic selected;
  var heart = false;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: FpayAppBar(height, context),
      extendBody: true,
      bottomNavigationBar: StylishBottomBar(
        items: [
          BottomBarItem(
              icon: Padding(
                padding: EdgeInsets.only(right: width * .1),
                child: Icon(
                  Icons.house_outlined,
                  size: 30,
                ),
              ),
              selectedIcon: Padding(
                padding: EdgeInsets.only(right: width * .1),
                child: Icon(
                  Icons.house_outlined,
                  size: 30,
                ),
              ),
              selectedColor: Color(0xff204394),
              backgroundColor: Colors.tealAccent,
              title: const Text('Home')),
          BottomBarItem(
              icon: Padding(
                padding: EdgeInsets.only(right: width * 0.2),
                child: Icon(Icons.wallet_membership_outlined, size: 25),
              ),
              selectedIcon: Padding(
                padding: EdgeInsets.only(right: width * 0.2),
                child: Icon(
                  Icons.wallet_membership_outlined,
                  size: 25,
                ),
              ),
              selectedColor: Color(0xff204394),
              backgroundColor: Colors.lightGreenAccent,
              title: const Text('Star')),
          BottomBarItem(
              icon: Padding(
                padding: EdgeInsets.only(left: width * 0.15),
                child: Icon(
                  Icons.style_outlined,
                  size: 25,
                ),
              ),
              selectedIcon: Padding(
                padding: EdgeInsets.only(left: width * 0.15),
                child: Icon(Icons.style, size: 25),
              ),
              backgroundColor: Colors.amber,
              selectedColor: Color(0xff204394),
              title: const Text('Style')),
          BottomBarItem(
              icon: Padding(
                padding: EdgeInsets.only(left: width * 0.08),
                child: Icon(Icons.person_outline, size: 25),
              ),
              selectedIcon: Padding(
                padding: EdgeInsets.only(left: width * 0.08),
                child: Icon(
                  Icons.person,
                ),
              ),
              backgroundColor: Colors.purpleAccent,
              selectedColor: Color(0xff204394),
              title: const Text('Profile')),
        ],
        hasNotch: true,
        // fabLocation: StylishBarFabLocation.center,
        currentIndex: selected ?? 0,

        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
        option: AnimatedBarOptions(
          // iconSize: 32,
          // barAnimation: BarAnimation.liquid,
          iconStyle: IconStyle.simple,

          // padding: EdgeInsets.all(width*0.1)

          // opacity: 0.3,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          QRScanner.qrScanner(context);
        },
        backgroundColor: Color(0xff204394),
        child: Icon(
          Icons.qr_code_2,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: PageView(
          controller: controller,
          onPageChanged: (val) {
            setState(() {
              print(val);
              selected = val;
            });
          },
          children: const [MainMenu(), Gerer(), Transactions(), Profil()],
        ),
      ),
    );
  }
}
