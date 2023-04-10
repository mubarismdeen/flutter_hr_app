class SalaryMaster {
  int id;
  int empCode;
  double salary;
  double nOtr;
  double sOtr;
  double overseas;
  double anchorage;
  int editBy;
  DateTime editDt;
  int creatBy;
  DateTime creatDt;

  SalaryMaster({
    required this.id,
    required this.empCode,
    required this.salary,
    required this.nOtr,
    required this.sOtr,
    required this.overseas,
    required this.anchorage,
    required this.editBy,
    required this.editDt,
    required this.creatBy,
    required this.creatDt,
  });


   // SalaryMaster.toJson();


  Map<String, dynamic> toJson() => {
    'id': id,
    'empCode': empCode,
    'salary': salary,
    'nOtr': nOtr,
    'sOtr': sOtr,
    'overseas': overseas,
    'anchorage': anchorage,
    'editBy': editBy,
    'editDt': editDt.toIso8601String(),
    'creatBy': creatBy,
    'creatDt': creatDt.toIso8601String(),
  };

  // SalaryMaster.fromJson(Map<String, dynamic> json) {
  //   id= json['id'] ?? 0;
  //   empCode = json['empCode']??0;
  //   salary = json['salary']??0.0;
  //   nOtr = json['nOtr']??0.0;
  //   sOtr = json['sOtr']??0.0;
  //   overseas = json['overseas']??0.0;
  //   anchorage = json['anchorage']??0.0;
  //   editBy = json['editBy']??0;
  //   editDt = DateTime.parse(json['editDt'])??DateTime.now();
  //   creatBy = json['creatBy']??0;
  //   creatDt = DateTime.parse(json['creatDt'])??DateTime.now();
  // }
}
