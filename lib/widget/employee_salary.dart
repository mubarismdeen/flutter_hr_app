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
  List<SalaryPay> _salaryPay = List<SalaryPay>.empty();


  getData() async {
    _salaryPay = await getSalaryPay(DateFormat('yyyy-MM').format(DateTime.now()));
  }

  void _showPaymentDialog(SalaryPay salary) {
    showDialog(
      context: context,
      builder: (context) {
        double paidAmount = salary.due;
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
                                  'Employee\nID',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Employee\nName',
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
                                  'Working\nDays',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Normal\nOvertime',
                                  style: tableHeaderStyle,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Special\nOvertime',
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
                                  'Net\nPayout',
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
                                DataCell(Text(salary.total.toString())),
                                DataCell(
                                  salary.due == 0
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
