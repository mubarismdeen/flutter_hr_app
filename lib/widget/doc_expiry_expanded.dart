import 'package:admin/constants/style.dart';
import 'package:admin/widget/doc_details_upload.dart';
import 'package:flutter/material.dart';

import '../api.dart';
import 'custom_alert_dialog.dart';

class DocExpiryExpanded extends StatefulWidget {
  @override
  _DocExpiryExpandedState createState() => _DocExpiryExpandedState();
}

class _DocExpiryExpandedState extends State<DocExpiryExpanded> {
  List<Map<String, dynamic>> tableData = <Map<String, String>>[];

  getTableData() async {
    tableData = await getDocDetails();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: getTableData(),
        builder: (context, AsyncSnapshot<dynamic> _data) {
          return Container(
            height: 500,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  showCheckboxColumn: false,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Narration',
                          style: tableHeaderStyle,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Document',
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
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Renewed Date',
                          style: tableHeaderStyle,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Edit By',
                          style: tableHeaderStyle,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Edit Date',
                          style: tableHeaderStyle,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Created By',
                          style: tableHeaderStyle,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Create Date',
                          style: tableHeaderStyle,
                        ),
                      ),
                    ),
                  ],
                  rows: tableData
                      .map(
                        (tableRow) => DataRow(
                          cells: [
                            DataCell(
                              Text(tableRow['narration'].toString()),
                            ),
                            DataCell(
                              Text(tableRow['docType'].toString()),
                            ),
                            DataCell(
                              Text(tableRow['dueDate'].toString()),
                            ),
                            DataCell(
                              Text(tableRow['renewedDate'].toString()),
                            ),
                            DataCell(
                              Text(tableRow['editBy'].toString()),
                            ),
                            DataCell(
                              Text(tableRow['editDt'].toString()),
                            ),
                            DataCell(
                              Text(tableRow['creatBy'].toString()),
                            ),
                            DataCell(
                              Text(tableRow['creatDt'].toString()),
                            )
                          ],
                          onSelectChanged: (selected) {
                            if (selected != null && selected) {
                              _openUploadDialog(tableRow);
                            }
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        });
  }

  void _openUploadDialog(tableRow) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          'Upload Job Details',
          DocDetailsUpload(closeDialog, tableRow),
        );
      },
    );
  }

  closeDialog() {
    setState(() {
      getTableData();
    });
  }
}
