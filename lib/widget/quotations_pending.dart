import 'package:admin/constants/style.dart';
import 'package:admin/widget/custom_text.dart';
import 'package:admin/widget/quotations_pending_expanded.dart';
import 'package:flutter/material.dart';

class QuotationsPending extends StatefulWidget {
  @override
  _QuotationsPendingState createState() => _QuotationsPendingState();
}

class _QuotationsPendingState extends State<QuotationsPending> {
  // final List<String> tableColumns = ["Employee", "Document", "Expiry"];
  final List<Map<String, String>> tableData = [
    {
      "Quotation": "Purchase",
      "Company": "ABC",
      "State": "Negotiation",
    },
    {
      "Quotation": "Claims",
      "Company": "DEF",
      "State": "Order placed",
    },
    {
      "Quotation": "Inventory",
      "Company": "GHI",
      "State": "In transit",
    },
    {
      "Quotation": "Purchase",
      "Company": "ABC",
      "State": "Negotiation",
    },
    {
      "Quotation": "Claims",
      "Company": "DEF",
      "State": "Order placed",
    },
    {
      "Quotation": "Inventory",
      "Company": "GHI",
      "State": "In transit",
    },
    {
      "Quotation": "Purchase",
      "Company": "ABC",
      "State": "Negotiation",
    },
    {
      "Quotation": "Claims",
      "Company": "DEF",
      "State": "Order placed",
    },
    {
      "Quotation": "Inventory",
      "Company": "GHI",
      "State": "In transit",
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
              text: "Quotations Pending",
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
                          'Quotation',
                          style: tableHeaderStyle,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Company',
                          style: tableHeaderStyle,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'State',
                          style: tableHeaderStyle,
                        ),
                      ),
                    ),
                  ],
                  rows: tableData
                      .map(
                        (tableRow) => DataRow(cells: [
                          DataCell(
                            Text(tableRow['Quotation'].toString()),
                          ),
                          DataCell(
                            Text(tableRow['Company'].toString()),
                          ),
                          DataCell(
                            Text(tableRow['State'].toString()),
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
                  child: const Text('View Details', style: TextStyle(fontWeight: FontWeight.bold, color: themeColor)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _openDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quotations Pending', style: TextStyle(fontWeight: FontWeight.bold),),
          content: QuotationsPendingExpanded(),
          insetPadding: const EdgeInsets.symmetric(horizontal: 100),
        );
      },
    );
  }
}
