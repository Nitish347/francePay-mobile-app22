import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final name = "Jad HARIRI";
    final email = "www.haririjad@outook.fr";
    final image = AssetImage("assets/images/photoIdentite.jpg");
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var padding = EdgeInsets.symmetric(horizontal: width / 60);
    return Drawer(
        child: Material(
      color: Color(0XFF1d3364),
      child: ListView(
        padding: padding,
        children: [
          buildHeader(
            name: name,
            email: email,
            image: image,
          ),
          SizedBox(height: height / 20),
          buildMenuItem(
            text: "People",
            icon: Icons.people,
          ),
          SizedBox(height: height / 20),
          buildMenuItem(
            text: "Favoris",
            icon: Icons.favorite_border,
          ),
          SizedBox(height: height / 25),
          buildMenuItem(
            text: "Travail",
            icon: Icons.workspaces_outline,
          ),
          SizedBox(height: height / 25),
          buildMenuItem(
            text: "Mise à jour",
            icon: Icons.update,
          ),
          SizedBox(
            height: height / 20,
          ),
          Divider(
            color: Colors.white70,
          ),
          SizedBox(
            height: height / 20,
          ),
          buildMenuItem(text: "Plugins", icon: Icons.account_tree_outlined),
          SizedBox(
            height: height / 25,
          ),
          buildMenuItem(
              text: "Notifications", icon: Icons.notifications_outlined),
        ],
      ),
    ));
  }

  Widget buildHeader(
          {required String name,
          required String email,
          required ImageProvider image}) =>
      InkWell(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20)
              .add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: image as ImageProvider,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "787314480@FPAY",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              //CircleAvatar(
              //radius: 24,
              //backgroundColor: Color.fromRGBO(30, 60, 168, 1),
              //child: Icon(Icons.add_comment_outlined, color: Colors.white,),
              //)
            ],
          ),
        ),
      );
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
}) {
  final color = Colors.white;
  final hoverColor = Colors.white70;
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(
      text,
      style: TextStyle(color: color),
    ),
    hoverColor: hoverColor,
    onTap: () {},
  );
}
