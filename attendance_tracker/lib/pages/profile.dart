import 'package:attendance_tracker/pages/dashboard.dart';
import 'package:attendance_tracker/services/globalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading:InkWell(
              child: Icon(
              CupertinoIcons.arrow_left,
              color: Vx.black,
              size: 50,
          ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
              },
            ),
          ),
          body: Center(
            child: (AnimatedContainer(
              duration: Duration.zero,
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Column(children: [
                  Icon(
                    CupertinoIcons.person,
                    size: 200,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Column(children: [
                        SizedBox(height: 30,),
                       Row(children: [
                          "Name :".text.size(25).blue600.make(), 
                          SizedBox(width: 30,),
                          (LoginCredentials.name).text.size(25).make(),
                        ],),
                                      
                      SizedBox(height: 10,),
                      Row(children: [
                          "User Id :".text.size(25).blue600.make(), 
                          SizedBox(width: 30,),
                          (LoginCredentials.email).text.size(25).make(),
                        ],),
                      
                      SizedBox(height: 10,),
                         Row(children: [
                          "Password :".text.size(25).blue600.make(), 
                          SizedBox(width: 30,),
                          ("*************").text.size(25).make(),
                        ],),
                      
                                    ]),
                    ),
                  ),
                  
                  ],)

                  
              ),
            )),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Vx.white,
            
          ),
        ),
      ),
    );
  }
}
