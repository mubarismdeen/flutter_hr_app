class LeaveSalary{
  int id = 0;
  int empCode = 0;
  String name = '';
  double salary = 0;
  double payAmt = 0;
  double pendingAmt = 0;
  double attendance = 0;
  double sickLeave = 0;
  double paidAmt = 0;
  bool paid = false;
  String editBy = '';
  DateTime editDate = DateTime.now();
  int creatBy = 0;
  DateTime creatDate = DateTime.now();

  LeaveSalary({
    required this.id,
    required this.empCode,
    required this.name,
    required this.editBy,
    required this.editDate,
    required this.creatBy,
    required this.creatDate,
    required this.salary,
    required this.payAmt,
    required this.pendingAmt,
    required this.attendance,
    required this.sickLeave,
    required this.paidAmt,
    required this.paid,
  });


  // SalaryMaster.toJson();


  Map<String, dynamic> toJson() => {
    'id': id,
    'empCode': empCode,
    'editBy': editBy,
    'editDate': editDate.toIso8601String(),
    'creatBy': creatBy,
    'creatDate': creatDate.toIso8601String(),
  };

  LeaveSalary.fromJson(Map<String, dynamic> json) {
    id= json['id'] ?? 0;
    empCode = json['empCode']??0;
    name = json['name']??'';
    editBy = json['editBy']??'';
    editDate = DateTime.parse(json['editDate'])??DateTime.now();
    creatBy = json['creatBy']??0;
    creatDate = DateTime.parse(json['creatDate'])??DateTime.now();
    salary = json['salary']??0.0;
    payAmt = json['payAmt']??0.0;
    pendingAmt = json['pendingAmt']??0.0;
    attendance = json['attendance']??0.0;
    sickLeave = json['sickLeave']??0.0;
    paidAmt = json['paidAmt']??0.0;
    paid = json['paid']??false;
  }
}
