import 'package:admin/constants/style.dart';
import 'package:flutter/material.dart';

class DocExpiryExpanded extends StatefulWidget {
  DocExpiryExpanded({required this.tableData});
  List<Map<String, dynamic>> tableData ;
  @override
  _DocExpiryExpandedState createState() => _DocExpiryExpandedState();
}

class _DocExpiryExpandedState extends State<DocExpiryExpanded> {

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
            rows: widget.tableData
                .map(
                  (tableRow) => DataRow(cells: [
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
                  ]),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
