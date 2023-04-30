import 'package:admin/constants/style.dart';
import 'package:admin/widget/custom_alert_dialog.dart';
import 'package:admin/widget/custom_text.dart';
import 'package:admin/widget/doc_details_upload.dart';
import 'package:admin/widget/doc_expiry_expanded.dart';
import 'package:flutter/material.dart';

import '../api.dart';
import 'package:intl/intl.dart';

class DocExpiry extends StatefulWidget {
  @override
  _DocExpiryState createState() => _DocExpiryState();
}

class _DocExpiryState extends State<DocExpiry> {
  List<Map<String, dynamic>> tableData = <Map<String, String>>[];

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        text: "Document Details",
                        size: 18,
                        color: Colors.black,
                        weight: FontWeight.bold,
                      ),
                      TextButton(
                        onPressed: _openUploadDialog,
                        child: Row(
                          children: const [
                            Icon(Icons.add, size: 16, weight: 900),
                            SizedBox(
                              width: 5,
                            ),
                            CustomText(
                                text: "Add New",
                                size: 14,
                                color: themeColor,
                                weight: FontWeight.bold),
                          ],
                        ),
                      ),
                    ],
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
                              (tableRow) => DataRow(
                                  color: MaterialStateColor.resolveWith((states) => _getRowColor(DateTime.parse(tableRow['dueDate']))),
                                  cells: [
                                DataCell(
                                  Text(tableRow['narration']),
                                ),
                                DataCell(
                                  Text(tableRow['docType']),
                                ),
                                DataCell(
                                  Text(DateFormat("yyyy-MM-dd")
                                      .format(
                                          DateTime.parse(tableRow['dueDate']))
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
                        onPressed: _openViewDialog,
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

  Color _getRowColor(DateTime docDate) {
    DateTime today = DateTime.now();
    int differenceInDays = docDate.difference(today).inDays;
    Color rowColor = Colors.transparent;
    if (differenceInDays < 0) {
      rowColor = Colors.red;
    } else if (differenceInDays < 10) {
      rowColor = Colors.orange;
    }
    return rowColor;
  }

  void _openViewDialog() {
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

  void _openUploadDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          'Upload Document Details',
          const DocDetailsUpload(),
        );
      },
    );
  }
}
