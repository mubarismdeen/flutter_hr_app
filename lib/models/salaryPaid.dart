class SalaryPaid {
  int id;
  int empCode;
  int type;
  double payable;
  double totalPaid;
  double due;
  String date;
  int paidBy;
  int paid;
  DateTime paidDt;
  int editBy;
  DateTime editDt;
  int creatBy;
  DateTime creatDt;

  SalaryPaid(
      {required this.id,
      required this.empCode,
      required this.type,
      required this.payable,
      required this.totalPaid,
      required this.due,
      required this.date,
      required this.paidBy,
      required this.paid,
      required this.paidDt,
      required this.editBy,
      required this.editDt,
      required this.creatBy,
      required this.creatDt});

  Map<String, dynamic> toJson() => {
        'id': id,
        'empCode': empCode,
        'type': type,
        'payable': payable,
        'totalPaid': totalPaid,
        'due': due,
        'date': date,
        'paidBy': paidBy,
        'paid': paid,
        'paidDt': paidDt.toIso8601String(),
        'editBy': editBy,
        'editDt': editDt.toIso8601String(),
        'creatBy': creatBy,
        'creatDt': creatDt.toIso8601String(),
      };
}
