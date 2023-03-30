import 'package:admin/constants/style.dart';
import 'package:admin/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class EmployeeSalary extends StatefulWidget {
  @override
  _EmployeeSalaryState createState() => _EmployeeSalaryState();
}

class _EmployeeSalaryState extends State<EmployeeSalary> {
  List<Salary> salaryData = [
    Salary("John Smith", 20, 2, 5, 2500.0),
    Salary("Jane Doe", 22, 1, 2, 2800.0),
    Salary("Mary Johnson", 21, 3, 3, 2600.0),
    Salary("Elizabeth Parker", 22, 1, 2, 2800.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
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
            const CustomText(
              text: "Salary",
              size: 18,
              color: Colors.black,
              weight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Employee Name',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Working Days',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Holidays Taken',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Overtime Hours',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Net Payout',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
              rows: salaryData
                  .map((salary) => DataRow(cells: [
                DataCell(Text(salary.employeeName)),
                DataCell(Text(salary.workingDays.toString())),
                DataCell(Text(salary.holidaysTaken.toString())),
                DataCell(Text(salary.overtimeHours.toString())),
                DataCell(Text(salary.netPayout.toStringAsFixed(2))),
              ]))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Salary {
  String employeeName;
  int workingDays;
  int holidaysTaken;
  int overtimeHours;
  double netPayout;

  Salary(this.employeeName, this.workingDays, this.holidaysTaken,
      this.overtimeHours, this.netPayout);
}
