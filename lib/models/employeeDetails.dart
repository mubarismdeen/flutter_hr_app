class EmployeeDetails {
  int id = 0;
  String empCode = '';
  String name = '';
  String mobile1 = '';
  String mobile2 = '';
  String department = '';
  String status = '';
  String nationality = '';
  DateTime? resignDt;
  DateTime birthDt = DateTime.now();
  DateTime joinDt = DateTime.now();
  String editBy = '';
  DateTime editDt = DateTime.now();
  String createBy = '';
  DateTime createDt = DateTime.now();

  EmployeeDetails({
    required this.id,
    required this.empCode,
    required this.name,
    required this.mobile1,
    required this.mobile2,
    required this.department,
    required this.status,
    required this.nationality,
    this.resignDt,
    required this.birthDt,
    required this.joinDt,
    required this.editBy,
    required this.editDt,
    required this.createBy,
    required this.createDt,
  });

  EmployeeDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    empCode = json['empCode'] ?? '';
    name = json['name'] ?? '';
    mobile1 = json['mobile1'] ?? '';
    mobile2 = json['mobile2'] ?? '';
    department = json['department'] ?? '';
    status = json['status'] ?? '';
    nationality = json['nationality'] ?? '';
    resignDt = json['resignDt'] != null ? DateTime.parse(json['resignDt']) : null;
    birthDt = json['birthDt'] != null ? DateTime.parse(json['birthDt']) : DateTime.now();
    joinDt = json['joinDt'] != null ? DateTime.parse(json['joinDt']) : DateTime.now();
    editBy = json['editBy'] ?? '';
    editDt = json['editDt'] != null ? DateTime.parse(json['editDt']) : DateTime.now();
    createBy = json['createBy'] ?? '';
    createDt = json['createDt'] != null ? DateTime.parse(json['createDt']) : DateTime.now();
  }
}
