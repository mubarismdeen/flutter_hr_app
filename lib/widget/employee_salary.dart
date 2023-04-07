import 'package:admin/constants/style.dart';
import 'package:flutter/material.dart';

class EmployeeSalary extends StatefulWidget {
  @override
  _EmployeeSalaryState createState() => _EmployeeSalaryState();
}

class _EmployeeSalaryState extends State<EmployeeSalary> {
  List<Salary> salaryData = [
    Salary("EMP001", "John Smith", "1234567890", 20, 2, 5, 2500.0),
    Salary("EMP002", "Jane Doe", "1234567891", 22, 1, 2, 2800.0),
    Salary("EMP003", "Mary Johnson", "1234567892", 21, 3, 3, 2600.0),
    Salary("EMP004", "Elizabeth Parker", "1234567893", 22, 1, 2, 2800.0),
  ];

  @override
  Widget build(BuildContext context) {
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
                            'MOL ID No',
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
                            'Holidays Taken',
                            style: tableHeaderStyle,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Overtime Hours',
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
                    rows: salaryData
                        .map((salary) => DataRow(cells: [
                      DataCell(Text(salary.employeeId)),
                      DataCell(Text(salary.employeeName)),
                      DataCell(Text(salary.molId)),
                      DataCell(Text(salary.workingDays.toString())),
                      DataCell(Text(salary.holidaysTaken.toString())),
                      DataCell(Text(salary.overtimeHours.toString())),
                      DataCell(Text(salary.netPayout.toStringAsFixed(2))),
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
