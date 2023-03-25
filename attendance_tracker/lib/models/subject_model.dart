// To parse this JSON data, do
//
//     final subject = subjectFromJson(jsonString);

// import 'dart:convert';

// Subject subjectFromJson(String str) => Subject.fromJson(json.decode(str));

// String subjectToJson(Subject data) => json.encode(data.toJson());

// class Subject {
//   Subject({
//     required this.userId,
//     required this.subject,
//     required this.totalclasses,
//     required this.attendclasses,
//     required this.id,
//     required this.v,
//   });
//   String id;
//   String userId;
//   String subject;
//   int totalclasses;
//   int attendclasses;
//   int v;

  // factory Subject.fromJson(Map<String, dynamic> json) => Subject(
  //       userId: json["UserId"],
  //       subject: json["subject"],
  //       totalclasses: json["totalclasses"],
  //       attendclasses: json["attendclasses"],
  //       v: json['v'],
  //       id: json['id'],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "UserId": userId,
  //       "subject": subject,
  //       "totalclasses": totalclasses,
  //       "attendclasses": attendclasses,
  //       "v": v,
  //       "id": id,
  //     };


// }


import 'dart:convert';

class SubjectModel {
   String id;
  String email;
  String subject;
  int totalclasses;
  int attendclasses;
  int v;
  SubjectModel({
    required this.id,
    required this.email,
    required this.subject,
    required this.totalclasses,
    required this.attendclasses,
    required this.v,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'userId': email});
    result.addAll({'subject': subject});
    result.addAll({'totalclasses': totalclasses});
    result.addAll({'attendclasses': attendclasses});
    result.addAll({'v': v});
  
    return result;
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      id: map['id'] ?? '',
      email: map['userId'] ?? '',
      subject: map['subject'] ?? '',
      totalclasses: map['totalclasses']?.toInt() ?? 0,
      attendclasses: map['attendclasses']?.toInt() ?? 0,
      v: map['v']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectModel.fromJson(String source) => SubjectModel.fromMap(json.decode(source));

  SubjectModel copyWith({
    String? id,
    String? email,
    String? subject,
    int? totalclasses,
    int? attendclasses,
    int? v,
  }) {
    return SubjectModel(
      id: id ?? this.id,
      email: email?? this.email,
      subject: subject ?? this.subject,
      totalclasses: totalclasses ?? this.totalclasses,
      attendclasses: attendclasses ?? this.attendclasses,
      v: v ?? this.v,
    );
  }
}
