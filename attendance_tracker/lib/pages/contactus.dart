import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';

class contactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Center(
              child:Image.asset('Assets/images/HarshitPic.png',height: 300,)
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: "Harshit Jain".text.bold.size(40).make()
            ),
            Center(
              child: "Developer".text.size(20).make()
            ),
            Row(children: [
              SizedBox(
                width: 60,
              ),
              Column(children: [
                 InkWell(
              child:Image.network('https://th.bing.com/th/id/OIP.JjD4-Aqm9Vwvn3ddtcfelgHaEK?pid=ImgDet&rs=1',height: 120,width: 120,)
            ),
            SizedBox(
              height: 60,
            ),
            InkWell(
              child: Image.network('https://1000logos.net/wp-content/uploads/2017/03/Color-of-the-LinkedIn-Logo.jpg',height: 120, width: 120,),
            onTap: ()=>launch('https://www.linkedin.com/in/harshit-jain-865a62211'))

              ],),
              SizedBox(
                width: 60,
              ),
              Column(children: [
                InkWell(
                  child:Image.network('https://pngimg.com/uploads/github/github_PNG40.png',height: 120,width: 120,),
                  onTap: ()=>launch('https://github.com/jharshit436')
                ),
                SizedBox(
                  height: 60,
                ),
                InkWell(
                  child:Image.network('https://www.amnesty.ie/wp-content/uploads/2020/05/Insta-logo.jpg',height: 120,width: 120,),onTap: ()=>launch('https://instagram.com/i_jainharshit?igshid=YmMyMTA2M2Y='),
                )
              ],)
            ],)
           
          ],
        ),
      ),
    );
  }
}
