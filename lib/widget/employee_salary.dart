import 'package:admin/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../api.dart';
import '../models/salaryPay.dart';

class EmployeeSalary extends StatefulWidget {
  @override
  _EmployeeSalaryState createState() => _EmployeeSalaryState();
}

class _EmployeeSalaryState extends State<EmployeeSalary> {
  List<Salary> salaryData = [
    Salary(
        "EMP001",
        "John Smith",
        "1234567890",
        20,
        2,
        5,
        2500.0),
    Salary(
        "EMP002",
        "Jane Doe",
        "1234567891",
        22,
        1,
        2,
        2800.0),
    Salary(
        "EMP003",
        "Mary Johnson",
        "1234567892",
        21,
        3,
        3,
        2600.0),
    Salary(
        "EMP004",
        "Elizabeth Parker",
        "1234567893",
        22,
        1,
        2,
        2800.0),
  ];
  List<SalaryPay> _salaryPay = List<SalaryPay>.empty();


  getData() async {
    _salaryPay = await getSalaryPay(DateFormat('yyyy-MM').format(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: getData(),
        builder: (context, AsyncSnapshot<dynamic> _data) {
          return SizedBox(
            height: 600,
            child: Card(
              shadowColor: shadowColor,
              margin: EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Employee ID',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Employee Name',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Basic',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Working Days',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Normal Overtime',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Special Overtime',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'overseas',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'anchorage',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Due',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Net Payout',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                          ],
                          rows: _salaryPay
                              .map((salary) =>
                              DataRow(cells: [
                                DataCell(Text(salary.empCode.toString())),
                                DataCell(Text(salary.name)),
                                DataCell(Text(salary.basic.toString())),
                                DataCell(Text(salary.attendance.toString())),
                                DataCell(Text(salary.nOtr.toString())),
                                DataCell(Text(salary.sOtr.toString())),
                                DataCell(Text(salary.overseas.toString())),
                                DataCell(Text(salary.anchorage.toString())),
                                DataCell(Text(salary.due.toString())),
                                DataCell(
                                    Text(salary.total.toString())),
                              ]))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
class Salary {
  String employeeId;
  String employeeName;
  String molId;
  int workingDays;
  int holidaysTaken;
  int overtimeHours;
  double netPayout;

  Salary(this.employeeId, this.employeeName, this.molId, this.workingDays, this.holidaysTaken,
      this.overtimeHours, this.netPayout);
}
