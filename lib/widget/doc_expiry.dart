import 'package:admin/constants/style.dart';
import 'package:admin/widget/custom_alert_dialog.dart';
import 'package:admin/widget/custom_text.dart';
import 'package:admin/widget/doc_expiry_expanded.dart';
import 'package:flutter/material.dart';

import '../api.dart';
import 'package:intl/intl.dart';

class DocExpiry extends StatefulWidget {
  @override
  _DocExpiryState createState() => _DocExpiryState();
}

class _DocExpiryState extends State<DocExpiry> {
  late final List<Map<String, String>> tableData0 = [
    {
      "EmpName": "Haadhi",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
    },
    {
      "EmpName": "Haadhi",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
    },
    {
      "EmpName": "Haadhi",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
    },
    {
      "EmpName": "Haadhi",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
    },
    {
      "EmpName": "Haadhi",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
    },
    {
      "EmpName": "Haadhi",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
    },
    {
      "EmpName": "Haadhi",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
    },
    {
      "EmpName": "Haadhi",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
    }
  ];

  List<Map<String, dynamic>> tableData = <Map<String, String>>[];

  // void init() {
  //   tableData = getDocDetails();
  // }

  getData() async {
    tableData = await getDocDetails();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: getData(),
        builder: (context, AsyncSnapshot<dynamic> _data) {
          return Card(
            shadowColor: shadowColor,
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomText(
                    text: "Document Details",
                    size: 18,
                    color: Colors.black,
                    weight: FontWeight.bold,
                  ),
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
                                'Name',
                                style: tableHeaderStyle,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Doc Type',
                                style: tableHeaderStyle,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Due Date',
                                style: tableHeaderStyle,
                              ),
                            ),
                          ),
                        ],
                        rows: tableData
                            .map(
                              (tableRow) => DataRow(cells: [
                                DataCell(
                                  Text(tableRow['narration']),
                                ),
                                DataCell(
                                  Text(tableRow['doctype']),
                                ),
                                DataCell(
                                  Text(DateFormat("yyyy-MM-dd")
                                      .parse(tableRow['dueDate'])
                                      .toString()),
                                ),
                              ]),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                        ),
                        onPressed: _openDialog,
                        child: const Text('View Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: themeColor)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _openDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          'Document Details',
          DocExpiryExpanded(tableData: tableData),
        );
      },
    );
  }
}
