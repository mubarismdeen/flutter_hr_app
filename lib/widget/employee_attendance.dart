import 'package:admin/constants/style.dart';
import 'package:flutter/material.dart';

class EmployeeAttendance extends StatefulWidget {
  @override
  _EmployeeAttendanceState createState() => _EmployeeAttendanceState();
}

class _EmployeeAttendanceState extends State<EmployeeAttendance> {
  List<AttendanceDto> attendances = [
    AttendanceDto("EMP001", "John", "1234567890", 24, 5, 2, 10, 5, 0, 3),
    AttendanceDto("EMP002", "Carl", "1234567891", 24, 4, 2, 11, 5, 0, 1),
    AttendanceDto("EMP003", "Max", "1234567892", 24, 3, 2, 8, 5, 0, 0),
    AttendanceDto("EMP004", "Hitler", "1234567893", 24, 2, 2, 12, 5, 0, 1),
    AttendanceDto("EMP004", "Hitler", "1234567893", 24, 2, 2, 12, 5, 0, 1),
    AttendanceDto("EMP004", "Hitler", "1234567893", 24, 2, 2, 12, 5, 0, 1),
    AttendanceDto("EMP004", "Hitler", "1234567893", 24, 2, 2, 12, 5, 0, 1),
    AttendanceDto("EMP004", "Hitler", "1234567893", 24, 2, 2, 12, 5, 0, 1),
    AttendanceDto("EMP004", "Hitler", "1234567893", 24, 2, 2, 12, 5, 0, 1),
    AttendanceDto("EMP004", "Hitler", "1234567893", 24, 2, 2, 12, 5, 0, 1),
    AttendanceDto("EMP004", "Hitler", "1234567893", 24, 2, 2, 12, 5, 0, 1),
    AttendanceDto("EMP004", "Hitler", "1234567893", 24, 2, 2, 12, 5, 0, 1),
    AttendanceDto("EMP004", "Hitler", "1234567893", 24, 2, 2, 12, 5, 0, 1),
    AttendanceDto("EMP004", "Hitler", "1234567893", 24, 2, 2, 12, 5, 0, 1),
  ];

  List<Map<String, String>> employees = [
    {
      "EmpId": "EMP001",
      "EmpName": "Muthu",
      "MolIdNo": "1234567890",
      "TotalAttendance": "24",
    },
    {
      "EmpName": "Munna",
      "AttStatus": "Absent",
    },
    {
      "EmpName": "Haadhi",
      "AttStatus": "Late",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 500,
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
              SizedBox(
                height: 500,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Employee \n     ID',
                            style: tableHeaderStyle,
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Employee \n  Name',
                              style: tableHeaderStyle,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'MOL ID \n    No',
                              style: tableHeaderStyle,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              '     Total \nAttendance',
                              style: tableHeaderStyle,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Off Days and \n  Sick Leave',
                              style: tableHeaderStyle,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              '      Loss of \nPayment Days',
                              style: tableHeaderStyle,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              '       Normal \nOvertime Hours',
                              style: tableHeaderStyle,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              '        Special \nOvertime Hours',
                              style: tableHeaderStyle,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Overseas \n    Days',
                              style: tableHeaderStyle,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Anchorage \n      Days',
                              style: tableHeaderStyle,
                            ),
                          ),
                        ),
                      ],
                      rows: attendances
                          .map((attendance) => DataRow(cells: [
                                DataCell(Text(attendance.employeeId)),
                                DataCell(Text(attendance.employeeName)),
                                DataCell(Text(attendance.molId)),
                                DataCell(
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      attendance.totalAttendance =
                                          double.parse(value);
                                    },
                                  ),
                                ),
                                DataCell(
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      attendance.totalOffAndSickDays =
                                          double.parse(value);
                                    },
                                  ),
                                ),
                                DataCell(
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      attendance.totalLossOfPaymentDays =
                                          double.parse(value);
                                    },
                                  ),
                                ),
                                DataCell(
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      attendance.totalNormalOvertimeHours =
                                          double.parse(value);
                                    },
                                  ),
                                ),
                                DataCell(
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      attendance.totalSpecialOvertimeHours =
                                          double.parse(value);
                                    },
                                  ),
                                ),
                                DataCell(
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      attendance.totalOverseasDays =
                                          double.parse(value);
                                    },
                                  ),
                                ),
                                DataCell(
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      attendance.totalAnchorageDays =
                                          double.parse(value);
                                    },
                                  ),
                                ),
                              ]))
                          .toList(),
                    ),
                  ),
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

class AttendanceDto {
  String employeeId;
  String employeeName;
  String molId;
  double totalAttendance = 0.0;
  double totalOffAndSickDays;
  double totalLossOfPaymentDays;
  double totalNormalOvertimeHours;
  double totalSpecialOvertimeHours;
  double totalOverseasDays;
  double totalAnchorageDays;

  AttendanceDto(
      this.employeeId,
      this.employeeName,
      this.molId,
      this.totalAttendance,
      this.totalOffAndSickDays,
      this.totalLossOfPaymentDays,
      this.totalNormalOvertimeHours,
      this.totalSpecialOvertimeHours,
      this.totalOverseasDays,
      this.totalAnchorageDays);
}
