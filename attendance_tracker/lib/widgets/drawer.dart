import 'package:attendance_tracker/pages/contactus.dart';
import 'package:attendance_tracker/pages/dashboard.dart';
import 'package:attendance_tracker/pages/profile.dart';
import 'package:attendance_tracker/services/dashboard_service.dart';
import 'package:attendance_tracker/services/globalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:velocity_x/velocity_x.dart';

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
      color: Vx.white,
      child: ListView(
        children: [
          DrawerHeader(child: Container(
            child: Column(children: [
              Icon(CupertinoIcons.person,size: 100,),
              Center(
                child: Column(children: [
                  SizedBox(height: 15,),
                  (LoginCredentials.email).text.color(Vx.blue500).make()
                ],),
              )
            ],),
          )),
          Column(
              children:[
                InkWell(
                  onTap: (){
                //Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                },
                  child: Container(
                      child:Row(children: [
                        Icon(CupertinoIcons.home,size: 40,),
                        SizedBox(width: 25,),
                        ("Home").text.bold.color(Vx.blue500).make()
                      ],
                )
              ),
            ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: (){
                    //Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Container(
                      child:Row(children: [
                        Icon(CupertinoIcons.person_alt_circle,size: 40,),
                        SizedBox(width: 15,),
                        ("Profile").text.color(Vx.blue500).bold.make()
                      ],
                      )
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: (){
                    //Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => contactUs()));
                  },
                  child: Container(
                      child:Row(children: [
                        Icon(CupertinoIcons.mail_solid,size: 40,),
                        SizedBox(width: 15,),
                        ("Contact Us").text.color(Vx.blue500).bold.make()
                      ],
                      )
                  ),
                ),
              ]
          )
    ]));
  }
}
