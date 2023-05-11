import 'package:intl/intl.dart';

class AttendanceModel {
  int id;
  int empCode;
  double attendance;
  double offdays;
  double lop;
  double novt;
  double sovt;
  double overseas;
  double anchorage;
  String date;
  int editBy;
  DateTime editDt;
  int creatBy;
  DateTime creatDt;

  AttendanceModel({
    required this.id,
    required this.empCode,
    required this.attendance,
    required this.offdays,
    required this.lop,
    required this.novt,
    required this.sovt,
    required this.overseas,
    required this.anchorage,
    required this.date,
    required this.editBy,
    required this.editDt,
    required this.creatBy,
    required this.creatDt,
  });

  // Attendance.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   empCode = json['empCode'];
  //   attendance = json['attendance'];
  //   offdays = json['offdays'];
  //   lop = json['lop'];
  //   novt = json['novt'];
  //   sovt = json['sovt'];
  //   overseas = json['overseas'];
  //   anchorage = json['anchorage'];
  //   editBy = json['editBy'];
  //   editDt = DateTime.parse(json['editDt']);
  //   creatBy = json['creatBy'];
  //   creatDt = DateTime.parse(json['creatDt']);
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['empCode'] = empCode;
    data['attendance'] = attendance;
    data['offdays'] = offdays;
    data['lop'] = lop;
    data['novt'] = novt;
    data['sovt'] = sovt;
    data['overseas'] = overseas;
    data['anchorage'] = anchorage;
    data['date'] = date;
    data['editBy'] = editBy;
    data['editDt'] = DateFormat('yyyy-MM-dd HH:mm').format(editDt);
    data['creatBy'] = creatBy;
    data['creatDt'] = DateFormat('yyyy-MM-dd HH:mm').format(creatDt);
    return data;
  }
}

// data['creatDt'] = creatDt.toIso8601String();