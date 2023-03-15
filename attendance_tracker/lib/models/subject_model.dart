// To parse this JSON data, do
//
//     final subject = subjectFromJson(jsonString);

import 'dart:convert';

Subject subjectFromJson(String str) => Subject.fromJson(json.decode(str));

String subjectToJson(Subject data) => json.encode(data.toJson());

class Subject {
    Subject({
        required this.userId,
        required this.subject,
        required this.totalclasses,
        required this.attendclasses,
        
    });

    String userId;
    String subject;
    int totalclasses;
    int attendclasses;

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        userId: json["UserId"],
        subject: json["subject"],
        totalclasses: json["totalclasses"],
        attendclasses: json["attendclasses"],
    );

    Map<String, dynamic> toJson() => {
        "UserId": userId,
        "subject": subject,
        "totalclasses": totalclasses,
        "attendclasses": attendclasses,
    };
}
