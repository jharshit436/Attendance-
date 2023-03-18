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

class Subject {
   String id;
  String userId;
  String subject;
  int totalclasses;
  int attendclasses;
  int v;
  Subject({
    required this.id,
    required this.userId,
    required this.subject,
    required this.totalclasses,
    required this.attendclasses,
    required this.v,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'userId': userId});
    result.addAll({'subject': subject});
    result.addAll({'totalclasses': totalclasses});
    result.addAll({'attendclasses': attendclasses});
    result.addAll({'v': v});
  
    return result;
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      subject: map['subject'] ?? '',
      totalclasses: map['totalclasses']?.toInt() ?? 0,
      attendclasses: map['attendclasses']?.toInt() ?? 0,
      v: map['v']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Subject.fromJson(String source) => Subject.fromMap(json.decode(source));

  Subject copyWith({
    String? id,
    String? userId,
    String? subject,
    int? totalclasses,
    int? attendclasses,
    int? v,
  }) {
    return Subject(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      subject: subject ?? this.subject,
      totalclasses: totalclasses ?? this.totalclasses,
      attendclasses: attendclasses ?? this.attendclasses,
      v: v ?? this.v,
    );
  }
}
