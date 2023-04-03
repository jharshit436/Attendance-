import 'dart:convert';

import 'package:attendance_tracker/models/dashboard_model.dart';
import 'package:attendance_tracker/models/subject_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'globalVariables.dart';

class MarkAttendace {
  void Present(
      {required BuildContext context,
      required String id,
      required String subject,
      required String email,
      required int total,
      required int attended}) async {
    try {
      Dashboard subjectdata = Dashboard(
          id: id.toString(),
          email: email,
          subject: subject,
          totalclasses: total + 1,
          attendclasses: attended + 1,
          v: 0,
          dashboardId: '');
      print(subjectdata.email);
      String CurrentUrl = Networkvariable.baseUrl +
          "/api/dashboard/updateDetails/" +
          subjectdata.id;
      var response = await http.post(Uri.parse(CurrentUrl),
          body: jsonEncode({
            "totalclasses": subjectdata.totalclasses,
            "attendclasses": subjectdata.attendclasses
          }),
          headers: {"Content-Type": "application/json"},
          encoding: Encoding.getByName("utf-8"));
      print(response.statusCode.toString());
      print(response.body.toString());
    } catch (e) {
      print(e);
    }
  }

  void Absent(
      {required BuildContext context,
      required String id,
      required String subject,
      required String email,
      required int total,
      required int attended}) async {
    try {
      Dashboard subjectdata = Dashboard(
          id: id.toString(),
          email: email,
          subject: subject,
          totalclasses: total + 1,
          attendclasses: attended,
          v: 0,
          dashboardId: '');
      print(subjectdata.attendclasses);
      String CurrentUrl = Networkvariable.baseUrl +
          "/api/dashboard/updateDetails/" +
          subjectdata.id;
      var response = await http.post(Uri.parse(CurrentUrl),
          body: jsonEncode({
            "totalclasses": subjectdata.totalclasses,
            "attendclasses": subjectdata.attendclasses
          }),
          headers: {"Content-Type": "application/json"},
          encoding: Encoding.getByName("utf-8"));
      print(response.statusCode.toString());
      print(response.body.toString());
    } catch (e) {
      print(e);
    }
  }

  void UndoAbsent(
      {required BuildContext context,
      required String id,
      required String subject,
      required String email,
      required int total,
      required int attended}) async {
    try {
      Dashboard subjectdata = Dashboard(
          id: id.toString(),
          email: email,
          subject: subject,
          totalclasses: total,
          attendclasses: attended - 1,
          v: 0,
          dashboardId: '');
      print(subjectdata.attendclasses);
      String CurrentUrl = Networkvariable.baseUrl +
          "/api/dashboard/updateDetails/" +
          subjectdata.id;
      var response = await http.post(Uri.parse(CurrentUrl),
          body: jsonEncode({
            "totalclasses": subjectdata.totalclasses,
            "attendclasses": subjectdata.attendclasses
          }),
          headers: {"Content-Type": "application/json"},
          encoding: Encoding.getByName("utf-8"));
      print(response.statusCode.toString());
      print(response.body.toString());
    } catch (e) {
      print(e);
    }
  }

  void UndoPresent(
      {required BuildContext context,
      required String id,
      required String subject,
      required String email,
      required int total,
      required int attended}) async {
    try {
      Dashboard subjectdata = Dashboard(
          id: id.toString(),
          email: email,
          subject: subject,
          totalclasses: total - 1,
          attendclasses: attended - 1,
          v: 0,
          dashboardId: '');
      print(subjectdata.attendclasses);
      String CurrentUrl = Networkvariable.baseUrl +
          "/api/dashboard/updateDetails/" +
          subjectdata.id;
      var response = await http.post(Uri.parse(CurrentUrl),
          body: jsonEncode({
            "totalclasses": subjectdata.totalclasses,
            "attendclasses": subjectdata.attendclasses
          }),
          headers: {"Content-Type": "application/json"},
          encoding: Encoding.getByName("utf-8"));
      print(response.statusCode.toString());
      print(response.body.toString());
    } catch (e) {
      print(e);
    }
  }

  void DeleteSubject(
      {required BuildContext context,
      required String id,
      required String subject,
      required String email,
      required int total,
      required int attended}) async {
    try {
      Dashboard subjectdata = Dashboard(
          id: id.toString(),
          email: email,
          subject: subject,
          totalclasses: total,
          attendclasses: attended,
          v: 0,
          dashboardId: '');
      print(subjectdata.attendclasses);
      String CurrentUrl =
          Networkvariable.baseUrl + "/api/dashboard/Delete/" + subjectdata.id;
      print(subjectdata.id);
      var response = await http.post(Uri.parse(CurrentUrl),
          body: jsonEncode({"id": subjectdata.id.toString()}),
          headers: {"Content-Type": "application/json"},
          encoding: Encoding.getByName("utf-8"));
      print(response.statusCode.toString());
    } catch (e) {
      print(e);
    }
  }
}
