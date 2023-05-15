import 'package:admin/constants/style.dart';
import 'package:flutter/material.dart';

class QuotationsPendingExpanded extends StatefulWidget {
  List<Map<String, dynamic>> tableData;
  QuotationsPendingExpanded(this.tableData);

  @override
  _QuotationsPendingExpandedState createState() =>
      _QuotationsPendingExpandedState();
}

class _QuotationsPendingExpandedState extends State<QuotationsPendingExpanded> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Client Name',
                    style: tableHeaderStyle,
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Vessel',
                    style: tableHeaderStyle,
                  ),
                ),
              ),
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
                    'Type',
                    style: tableHeaderStyle,
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Date',
                    style: tableHeaderStyle,
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'PO Status',
                    style: tableHeaderStyle,
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Invoice Status',
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
            ],
            rows: widget.tableData
                .map(
                  (tableRow) => DataRow(cells: [
                    DataCell(
                      Text(tableRow['clientName'].toString()),
                    ),
                    DataCell(
                      Text(tableRow['name'].toString()),
                    ),
                    DataCell(
                      Text(tableRow['narration'].toString()),
                    ),
                    DataCell(
                      Text(tableRow['type'].toString()),
                    ),
                    DataCell(
                      Text(tableRow['date'].toString()),
                    ),
                    DataCell(
                      Text(tableRow['poStatus'].toString()),
                    ),
                    DataCell(
                      Text(tableRow['invStatus'].toString()),
                    ),
                    DataCell(
                      Text(tableRow['dueDate'].toString()),
                    ),
                    DataCell(
                      Text(tableRow['creatBy'].toString()),
                    ),
                    DataCell(
                      Text(tableRow['creatDt'].toString()),
                    ),
                    DataCell(
                      Text(tableRow['editBy'].toString()),
                    ),
                    DataCell(
                      Text(tableRow['editDt'].toString()),
                    ),
                  ]),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
