import 'package:admin/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class EmployeeAttendance extends StatefulWidget {
  @override
  _EmployeeAttendanceState createState() => _EmployeeAttendanceState();
}

class _EmployeeAttendanceState extends State<EmployeeAttendance> {

  List<Map<String,String>> employees = [
    {
      "EmpName":"Muthu",
      "AttStatus":"Present",
    },
    {
      "EmpName":"Munna",
      "AttStatus":"Absent",
    },
    {
      "EmpName":"Haadhi",
      "AttStatus":"Late",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Card(
        shadowColor: shadowColor,
        margin: EdgeInsets.only(top: 20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
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
                  rows: employees
                      .map((employee) => DataRow(cells: [
                            DataCell(Text(employee['EmpName'].toString())),
                            DataCell(Text(formatDate(
                                DateTime.now(), [yyyy, '-', mm, '-', dd]))),
                            DataCell(DropdownButton(
                              value: employee['AttStatus'].toString(),
                              items: const [
                                DropdownMenuItem(
                                    value: 'Present', child: Text('Present')),
                                DropdownMenuItem(
                                    value: 'Absent', child: Text('Absent')),
                                DropdownMenuItem(
                                    value: 'Late', child: Text('Late')),
                              ],
                              onChanged: (value) => setState(
                                  () => employee['AttStatus'] = value.toString()),
                            ))
                            // DataCell(Text(attendance.attendanceStatus)),
                          ]))
                      .toList(),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                  ),
                  onPressed: () {},
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


