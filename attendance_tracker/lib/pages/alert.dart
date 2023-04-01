import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Alerts extends StatefulWidget {
  const Alerts({Key? key}) : super(key: key);

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(CupertinoIcons.bell),
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: ((BuildContext context) {
              return SizedBox(
                height: 100,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(children: [
                      SizedBox(height: 30,),
                      Center(child: ("No Alerts found").text.size(39).italic.make()),

                    ],)
                    
                  ),
                ),
              );
            }));
      },
    );
  }
}
