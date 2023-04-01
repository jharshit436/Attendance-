// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

import 'dart:convert';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

class Dashboard {
  Dashboard({
    required this.dashboardId,
    required this.totalclasses,
    required this.attendclasses,
    required this.email,
    required this.id,
    required this.v,
    required this.subject,
  });

  String dashboardId;
  int totalclasses;
  int attendclasses;
  String email;
  String id;
  int v;
  String subject;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        dashboardId: json["id"],
        totalclasses: json["totalclasses"],
        attendclasses: json["attendclasses"],
        email: json["email"],
        id: json["_id"],
        v: json["__v"],
        subject: json["subject"]
      );

  Map<String, dynamic> toJson() => {
        "id": dashboardId,
        "totalclasses": totalclasses,
        "attendclasses": attendclasses,
        "email": email,
        "_id": id,
        "__v": v,
        "subject":subject
      };
}
