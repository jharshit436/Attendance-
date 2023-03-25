import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
            leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/Dashboard');
              },
              child: Icon(
                CupertinoIcons.arrow_left,
                color: Vx.black,
                size: 50,
              ),
            ),
          ),
          body: Center(
            child: (AnimatedContainer(
              duration: Duration.zero,
              child: Column(children: [
                Icon(
                  CupertinoIcons.person,
                  size: 200,
                )
              ]),
            )),
          ),
        ),
      ),
    );
  }
}
