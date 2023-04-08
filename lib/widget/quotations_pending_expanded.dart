import 'package:admin/constants/style.dart';
import 'package:flutter/material.dart';

class QuotationsPendingExpanded extends StatefulWidget {
  @override
  _QuotationsPendingExpandedState createState() => _QuotationsPendingExpandedState();
}

class _QuotationsPendingExpandedState extends State<QuotationsPendingExpanded> {
  final List<Map<String, String>> tableData = [
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
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Emp Code',
                    style: tableHeaderStyle,
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Emp Name',
                    style: tableHeaderStyle,
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Doc ID',
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
                  (tableRow) => DataRow(cells: [
                DataCell(
                  Text(tableRow['EmpCode'].toString()),
                ),
                DataCell(
                  Text(tableRow['EmpName'].toString()),
                ),
                DataCell(
                  Text(tableRow['DocId'].toString()),
                ),
                DataCell(
                  Text(tableRow['DocType'].toString()),
                ),
                DataCell(
                  Text(tableRow['DueDate'].toString()),
                ),
                DataCell(
                  Text(tableRow['RenewedDate'].toString()),
                ),
                DataCell(
                  Text(tableRow['EditBy'].toString()),
                ),
                DataCell(
                  Text(tableRow['EditDate'].toString()),
                ),
                DataCell(
                  Text(tableRow['CreateBy'].toString()),
                ),
                DataCell(
                  Text(tableRow['CreateDate'].toString()),
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
