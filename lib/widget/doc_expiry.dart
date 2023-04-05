import 'package:admin/constants/style.dart';
import 'package:admin/widget/custom_text.dart';
import 'package:flutter/material.dart';

class DocExpiry extends StatefulWidget {
  @override
  _DocExpiryState createState() => _DocExpiryState();
}

class _DocExpiryState extends State<DocExpiry> {
  // final List<String> tableColumns = ["Employee", "Document", "Expiry"];
  final List<Map<String, String>> tableData = [
    {
      "Employee": "Haadhi",
      "Document": "Passport",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Muthu",
      "Document": "Permit",
      "Expiry": "01/02/2024",
    },
    {
      "Employee": "Munna",
      "Document": "Iqama",
      "Expiry": "01/02/2024",
    }
  ];

  @override
  Widget build(BuildContext context) {
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
              text: "Upcoming Expiries",
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
                          'Employee',
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
                          'Expiry',
                          style: tableHeaderStyle,
                        ),
                      ),
                    ),
                  ],
                  rows: tableData
                      .map(
                        (tableRow) => DataRow(cells: [
                          DataCell(
                            Text(tableRow['Employee'].toString()),
                          ),
                          DataCell(
                            Text(tableRow['Document'].toString()),
                          ),
                          DataCell(
                            Text(tableRow['Expiry'].toString()),
                          ),
                        ]),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
