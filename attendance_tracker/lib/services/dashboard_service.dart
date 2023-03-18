import 'dart:convert';
import 'dart:ffi';
import 'package:attendance_tracker/models/subject_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'globalVariables.dart';

class Subjects {
  List<Subject> s = [];
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
          attendclasses: attendclasses,
          v: 0,
          id: " ");
      http.Response response = await http.post(Uri.parse(CurrentUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(subjectdata.toJson()),
          encoding: Encoding.getByName("utf-8"));
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }



  Future<List<Subject?>> getSubject() async {
    List<Subject> sujectAttend = [];
    var CurrentUrl =
        "${Networkvariable.baseUrl}/api/dashboard/${LoginCredentials.email}";
    final response = await http.get(Uri.parse(CurrentUrl));

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<dynamic> prods = json.decode(response.body);
      print(prods);
      return prods.map((e) => Subject.fromMap(e)).toList();
      
    } else {
      throw Exception('Failed to load album');
    }
  }
}
