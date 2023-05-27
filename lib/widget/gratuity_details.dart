import 'package:admin/constants/style.dart';
import 'package:admin/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../api.dart';
import '../models/salaryPaid.dart';

class GratuityDetailsWidget extends StatefulWidget {
  dynamic closeDialog;
  List<Map<String, dynamic>> gratuityDetails;
  GratuityDetailsWidget(this.gratuityDetails, this.closeDialog, {Key? key})
      : super(key: key);

  @override
  _GratuityDetailsWidgetState createState() => _GratuityDetailsWidgetState();
}

class _GratuityDetailsWidgetState extends State<GratuityDetailsWidget> {
  double _paidAmount = 0;

  SalaryPaid _salaryPaid = SalaryPaid(
      id: 0,
      empCode: 0,
      type: 1,
      payable: 0,
      totalPaid: 0,
      due: 0,
      date: '',
      paidBy: 0,
      paid: false,
      paidDt: DateTime.now(),
      editBy: 0,
      editDt: DateTime.now(),
      creatBy: 0,
      creatDt: DateTime.now());


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 500),
        child: getCustomCard(
          Column(
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
                            'Employee Code',
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
                            'Served Years',
                            style: tableHeaderStyle,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Type',
                            style: tableHeaderStyle,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Gratuity Amount',
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
                    rows: widget.gratuityDetails
                        .map((gratuity) => DataRow(cells: [
                              DataCell(Text(gratuity['empCode'].toString())),
                              DataCell(Text(gratuity['name'])),
                              DataCell(
                                  Text(gratuity['servedYears'].toString())),
                              DataCell(Text(gratuity['type'])),
                              DataCell(
                                  Text(gratuity['gratuityAmt'].toString())),
                              DataCell(
                                gratuity['paid']
                                    ? const Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.green,
                                      )
                                    : gratuity['gratuityAmt'] == 0.0
                                        ? const Icon(
                                            Icons.check_circle_outline,
                                            color: Colors.grey,
                                          )
                                        : TextButton(
                                            onPressed: () => _showPaymentDialog(
                                                gratuity['empCode'],
                                                gratuity['gratuityAmt'],
                                                gratuity['name']),
                                            child: const Text('Pay',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueAccent)),
                                          ),
                              ),
                              // DataCell(Text(gratuity.editBy.toString())),
                              // DataCell(Text(getDateStringFromDateTime(gratuity.editDt))),
                              // DataCell(Text(gratuity.creatBy.toString())),
                              // DataCell(Text(getDateStringFromDateTime(gratuity.creatDt))),
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

  void _showPaymentDialog(empCode, gratuityAmt, name) {
    showDialog(
      context: context,
      builder: (context) {
        _paidAmount = gratuityAmt;
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Payment to ${name} (#${empCode})'),
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
            initialValue: _paidAmount.toString(),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              _paidAmount = double.tryParse(value) ?? _paidAmount;
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
                      _submitForm(empCode, gratuityAmt, name);
                      Navigator.of(context).pop();
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

  Future<void> _submitForm(empCode, gratuityAmt, name) async {
    _salaryPaid.type = 3;
    _salaryPaid.empCode = empCode;
    _salaryPaid.payable = gratuityAmt;
    _salaryPaid.totalPaid = _paidAmount;
    _salaryPaid.due = gratuityAmt - _paidAmount;
    _salaryPaid.date = DateFormat('yyyy-MM').format(DateTime.now()).toString();
    _salaryPaid.paidBy = 1;
    _salaryPaid.paid = _salaryPaid.due == 0 ? true : false;
    // _salaryPaid.paid = salary.due == _paidAmount ? 1 : 0;
    _salaryPaid.creatBy = 1;
    _salaryPaid.editBy = 1;

    bool status = await saveSalaryPaid(_salaryPaid);
    if (status) {
      Fluttertoast.showToast(
        msg: "Saved",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
        webPosition: "center",
        webShowClose: false,
      );
      widget.closeDialog();
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: "failed to save",
          message: '',
          icon: Icon(Icons.refresh),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
