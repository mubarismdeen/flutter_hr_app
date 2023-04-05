import 'package:admin/constants/style.dart';
import 'package:admin/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class EmployeeAttendance extends StatefulWidget {
  @override
  _EmployeeAttendanceState createState() => _EmployeeAttendanceState();
}

class _EmployeeAttendanceState extends State<EmployeeAttendance> {
  List<Attendance> attendanceData = [
    Attendance("John Smith", DateTime(2023, 3, 1), "Present"),
    Attendance("Jane Doe", DateTime(2023, 3, 1), "Absent"),
    Attendance("John Smith", DateTime(2023, 3, 2), "Late"),
    Attendance("Jane Doe", DateTime(2023, 3, 2), "Present"),
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
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const <DataColumn>[
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
                          'Date',
                          style: tableHeaderStyle,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Attendance Status',
                          style: tableHeaderStyle,
                        ),
                      ),
                    ),
                  ],
                  rows: attendanceData
                      .map((attendance) => DataRow(cells: [
                            DataCell(Text(attendance.employeeName)),
                            DataCell(Text(formatDate(attendance.date, [yyyy, '-', mm, '-', dd]))),
                            DataCell(Text(attendance.attendanceStatus)),
                          ]))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Attendance {
  String employeeName;
  DateTime date;
  String attendanceStatus;

  Attendance(this.employeeName, this.date, this.attendanceStatus);
}
