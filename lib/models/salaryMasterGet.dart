class SalaryMasterGet {
  int id = 0;
  int empCode = 0;
  String name = '';
  double salary = 0;
  double nOtr = 0;
  double sOtr = 0;
  double overseas = 0;
  double anchorage = 0;
  String editBy = '';
  DateTime editDt = DateTime.now();
  String creatBy = '';
  DateTime creatDt = DateTime.now();

  SalaryMasterGet({
    required this.id,
    required this.empCode,
    required this.name,
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

  Map<String, dynamic> toJson() => {
    'id': id,
    'empCode': empCode,
    'name': name,
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

  SalaryMasterGet.fromJson(Map<String, dynamic> json) {
    id= json['id'] ?? 0;
    empCode = json['empCode']??0;
    name = json['name']??'';
    salary = json['salary']??0.0;
    nOtr = json['novt']??0.0;
    sOtr = json['sovt']??0.0;
    overseas = json['overseas']??0.0;
    anchorage = json['anchorage']??0.0;
    editBy = json['editBy']??'';
    editDt = DateTime.parse(json['editDt']);
    creatBy = json['creatBy']??'';
    creatDt = DateTime.parse(json['creatDt']);
  }
}
