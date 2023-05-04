import 'package:admin/constants/style.dart';
import 'package:admin/models/leaveSalary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../api.dart';

class LeaveSalaryWidget extends StatefulWidget {
  @override
  _LeaveSalaryWidgetState createState() => _LeaveSalaryWidgetState();
}

class _LeaveSalaryWidgetState extends State<LeaveSalaryWidget> {
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
  List<LeaveSalary> _leaveSalaries = List<LeaveSalary>.empty();


  getData() async {
    _leaveSalaries = await getLeaveSalary(DateFormat('yyyy').format(DateTime.now()));
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
                                  'Salary',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Attendance',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Sick Leave',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Pay Amount',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Paid Amount',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Pending Amount',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                          ],
                          rows: _leaveSalaries
                              .map((salary) =>
                              DataRow(cells: [
                                DataCell(Text(salary.empCode.toString())),
                                DataCell(Text(salary.name)),
                                DataCell(Text(salary.salary.toString())),
                                DataCell(Text(salary.attendance.toString())),
                                DataCell(Text(salary.sickLeave.toString())),
                                DataCell(Text(salary.payAmt.toString())),
                                DataCell(Text(salary.paidAmt.toString())),
                                DataCell(Text(salary.pendingAmt.toString())),
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
