import 'dart:convert';
import 'package:attendance_tracker/models/subject_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'globalVariables.dart';

class Subjects {
  void addSubject(
      {required BuildContext context,
      required String userId,
      required String subject,
      required int totalclasses,
      required int attendclasses}) async {
    try {
      String CurrentUrl =
          Networkvariable.baseUrl + "/api/dashboard/createsubject";
      Subject subjectdata = Subject(
          userId: userId,
          subject: subject,
          totalclasses: totalclasses,
          attendclasses: attendclasses);
      http.Response response = await http.post(Uri.parse(CurrentUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(subjectdata.toJson()),
          encoding: Encoding.getByName("utf-8"));
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

 // late List<dynamic> list;

  // static void getSubjects(
  //     {required BuildContext context, required String UserId}) async {
  //   try {
  //     var CurrentUrl =
  //         Networkvariable.baseUrl + "/api/dashboard" + LoginCredentials.email;
  //     final response = await http.get(Uri.parse(CurrentUrl));
  //     var data = jsonDecode(response.body);
  //     List<dynamic> list = json
  //         .decode(response.body)['results']
  //         .map((data) => Subject.fromJson(data))
  //         .toList();
  //     if (response.statusCode == 200) {
  //       print("GetSubject Api Fetched");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //}
}
