import 'dart:convert';

import 'package:attendance_tracker/models/user_model.dart';
import 'package:attendance_tracker/pages/dashboard.dart';
import 'package:attendance_tracker/services/globalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // void SignUpUser({
  //   required BuildContext context,
  //     required String name,
  //     required String email,
  //     required String password}) async {
  //   try {
  //     User userData =
  //         User(name: name, email: email, password: password, id: "", v: 0);
  //     String CurrentUrl = Networkvariable.baseUrl + "/api/user/createaccount";
  //     var response = await http.post(Uri.parse(CurrentUrl),
  //         headers: {
  //           "Accept": "application/json",
  //           "Content-Type": "application/x-www-form-urlencoded"
  //         },
  //         body: jsonEncode(userData),
  //         encoding: Encoding.getByName("utf-8"));
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //     } else {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text("Helllo")));
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  void SignUpUser(
      {required BuildContext context,
      required String name,
      required String email,
      required String Password}) async {
    try {
      String CurrentUrl = Networkvariable.baseUrl + "/api/user/createaccount";
      User userData = User(name: name, email: email, password: Password);
      http.Response response = await http.post(Uri.parse(CurrentUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(userData.toJson()),
          encoding: Encoding.getByName("utf-8"));
      print(response.statusCode);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "Registration Successfull, Login using Same Credentials ")));

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
        LoginCredentials.email = email;
      } else {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text("Sending Message"),)
        // );
      }
    } catch (e) {
      print(e);
    }
  }

  void SignInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    User userData = User(name: " ", email: email, password: password);
    try {
      String CurrentUrl = Networkvariable.baseUrl + '/api/user/login';
      http.Response response = await http.post(Uri.parse(CurrentUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(userData.toJson()),
          encoding: Encoding.getByName("utf-8"));
      print(response.statusCode);

      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
        print("Success");
        LoginCredentials.email = email;
      } else if (response.statusCode == 401) {
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }
}
