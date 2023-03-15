import 'package:attendance_tracker/services/dashboard_service.dart';
import 'package:attendance_tracker/services/globalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final ImageUrl = "https://www.psdgraphics.com/file/user-icon.jpg";
  @override
  Widget build(BuildContext context) {
      return Container(
        child: ListView(
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.black12),
                  accountEmail: Text(LoginCredentials.email,
                      style: TextStyle(color: Colors.black)),
                  accountName:
                      Text("Harshit", style: TextStyle(color: Colors.black)),
                  // currentAccountPicture: Image.network(ImageUrl), for square image
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(ImageUrl),
                    radius: 40,
                  )),
            ),
            ListTile(
              onTap: () {
                
              },
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.blueAccent,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.blueAccent,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail_solid,
                color: Colors.blueAccent,
              ),
              title: Text(
                "Contact Us",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      );
  }
}
