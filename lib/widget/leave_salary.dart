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
  List<LeaveSalary> _leaveSalaries = List<LeaveSalary>.empty();


  getData() async {
    _leaveSalaries = await getLeaveSalary(DateFormat('yyyy').format(DateTime.now()));
  }

  void _showPaymentDialog(LeaveSalary salary) {
    showDialog(
      context: context,
      builder: (context) {
        double paidAmount = salary.pendingAmt;
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Payment to ${salary.name} (#${salary.empCode})'),
              const SizedBox(
                width: 35,
              ),
              TextButton(
                style: const ButtonStyle(alignment: Alignment.topRight),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.clear,
                  color: themeColor,
                ),
              ),
            ],
          ),
          content: TextFormField(
            initialValue: paidAmount.toString(),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              paidAmount = double.tryParse(value) ?? paidAmount;
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor,
                    ),
                    onPressed: () {
                      // ToDo : Integrate API
                    },
                    child: const Text('Submit'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
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
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Payment',
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
                                DataCell(
                                  salary.pendingAmt == 0
                                      ? const Icon(Icons.check_circle_outline, color: Colors.green,)
                                      : TextButton(
                                    onPressed: () => _showPaymentDialog(salary),
                                    child: const Text('Pay', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                                  ),
                                ),
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
