class EmployeeDetails {
  int empCode = 0;
  String name = '';
  String mobile1 = '';
  String mobile2 = '';
  String department = '';
  String status = '';
  String nationality = '';
  DateTime birthDt = DateTime.now();
  DateTime joinDt = DateTime.now();
  String editBy = '';
  DateTime editDt = DateTime.now();
  String createBy = '';
  DateTime createDt = DateTime.now();

  EmployeeDetails({
    required this.empCode,
    required this.name,
    required this.mobile1,
    required this.mobile2,
    required this.department,
    required this.status,
    required this.nationality,
    required this.birthDt,
    required this.joinDt,
    required this.editBy,
    required this.editDt,
    required this.createBy,
    required this.createDt,
  });

  EmployeeDetails.fromJson(Map<String, dynamic> json) {
    empCode = json['empCode']??0;
    name = json['name']??'';
    mobile1 = json['mobile1']??0.0;
    mobile2 = json['mobile2']??0.0;
    department = json['department']??0.0;
    status = json['status']??0.0;
    nationality = json['nationality']??0.0;
    birthDt = DateTime.parse(json['birthDt']);
    joinDt = DateTime.parse(json['joinDt']);
    editBy = json['editBy']??'';
    editDt = DateTime.parse(json['editDt']);
    createBy = json['createBy']??'';
    createDt = DateTime.parse(json['createDt']);
  }
}
