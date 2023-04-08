import 'package:admin/constants/style.dart';
import 'package:flutter/material.dart';

class DocExpiryExpanded extends StatefulWidget {
  DocExpiryExpanded({required this.tableData});
  List<Map<String, dynamic>> tableData ;
  @override
  _DocExpiryExpandedState createState() => _DocExpiryExpandedState();
}

class _DocExpiryExpandedState extends State<DocExpiryExpanded> {
  final List<Map<String, String>> tableData0 = [
    {
      "EmpCode": "EMP001",
      "EmpName": "Mubaris",
      "DocId": "DOC001",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
      "RenewedDate": "01/02/2022",
      "EditBy": "Munna",
      "EditDate": "01/02/2022",
      "CreateBy": "Munna",
      "CreateDate": "01/02/2022",
    },
    {
      "EmpCode": "EMP001",
      "EmpName": "Mubaris",
      "DocId": "DOC001",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
      "RenewedDate": "01/02/2022",
      "EditBy": "Munna",
      "EditDate": "01/02/2022",
      "CreateBy": "Munna",
      "CreateDate": "01/02/2022",
    },
    {
      "EmpCode": "EMP001",
      "EmpName": "Mubaris",
      "DocId": "DOC001",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
      "RenewedDate": "01/02/2022",
      "EditBy": "Munna",
      "EditDate": "01/02/2022",
      "CreateBy": "Munna",
      "CreateDate": "01/02/2022",
    },
    {
      "EmpCode": "EMP001",
      "EmpName": "Mubaris",
      "DocId": "DOC001",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
      "RenewedDate": "01/02/2022",
      "EditBy": "Munna",
      "EditDate": "01/02/2022",
      "CreateBy": "Munna",
      "CreateDate": "01/02/2022",
    },
    {
      "EmpCode": "EMP001",
      "EmpName": "Mubaris",
      "DocId": "DOC001",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
      "RenewedDate": "01/02/2022",
      "EditBy": "Munna",
      "EditDate": "01/02/2022",
      "CreateBy": "Munna",
      "CreateDate": "01/02/2022",
    },
    {
      "EmpCode": "EMP001",
      "EmpName": "Mubaris",
      "DocId": "DOC001",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
      "RenewedDate": "01/02/2022",
      "EditBy": "Munna",
      "EditDate": "01/02/2022",
      "CreateBy": "Munna",
      "CreateDate": "01/02/2022",
    },
    {
      "EmpCode": "EMP001",
      "EmpName": "Mubaris",
      "DocId": "DOC001",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
      "RenewedDate": "01/02/2022",
      "EditBy": "Munna",
      "EditDate": "01/02/2022",
      "CreateBy": "Munna",
      "CreateDate": "01/02/2022",
    },
    {
      "EmpCode": "EMP001",
      "EmpName": "Mubaris",
      "DocId": "DOC001",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
      "RenewedDate": "01/02/2022",
      "EditBy": "Munna",
      "EditDate": "01/02/2022",
      "CreateBy": "Munna",
      "CreateDate": "01/02/2022",
    },
    {
      "EmpCode": "EMP001",
      "EmpName": "Mubaris",
      "DocId": "DOC001",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
      "RenewedDate": "01/02/2022",
      "EditBy": "Munna",
      "EditDate": "01/02/2022",
      "CreateBy": "Munna",
      "CreateDate": "01/02/2022",
    },
    {
      "EmpCode": "EMP001",
      "EmpName": "Mubaris",
      "DocId": "DOC001",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
      "RenewedDate": "01/02/2022",
      "EditBy": "Munna",
      "EditDate": "01/02/2022",
      "CreateBy": "Munna",
      "CreateDate": "01/02/2022",
    },
    {
      "EmpCode": "EMP001",
      "EmpName": "Mubaris",
      "DocId": "DOC001",
      "DocType": "Passport",
      "DueDate": "01/02/2024",
      "RenewedDate": "01/02/2022",
      "EditBy": "Munna",
      "EditDate": "01/02/2022",
      "CreateBy": "Munna",
      "CreateDate": "01/02/2022",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columns: const <DataColumn>[
              // DataColumn(
              //   label: Expanded(
              //     child: Text(
              //       'Emp Code',
              //       style: tableHeaderStyle,
              //     ),
              //   ),
              // ),
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
              // DataColumn(
              //   label: Expanded(
              //     child: Text(
              //       'Doc Type',
              //       style: tableHeaderStyle,
              //     ),
              //   ),
              // ),
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
            rows: widget.tableData
                .map(
                  (tableRow) => DataRow(cells: [
                    DataCell(
                      Text(tableRow['narration'].toString()),
                    ),
                    DataCell(
                      Text(tableRow['doctype'].toString()),
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
                  ]),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
