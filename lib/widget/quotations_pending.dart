import 'package:admin/api.dart';
import 'package:admin/constants/style.dart';
import 'package:admin/widget/custom_alert_dialog.dart';
import 'package:admin/widget/custom_text.dart';
import 'package:admin/widget/quotations_pending_expanded.dart';
import 'package:admin/widget/quotations_upload.dart';
import 'package:flutter/material.dart';

class QuotationsPending extends StatefulWidget {
  @override
  _QuotationsPendingState createState() => _QuotationsPendingState();
}

class _QuotationsPendingState extends State<QuotationsPending> {
  List<Map<String, dynamic>> tableData = <Map<String, String>>[];

  getData() async {
    tableData = await getQuotationDetails();
  }

  closeDialog() {
    setState(() {
      getData();
    });
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
                        text: "Quotations",
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
                        ],
                        rows: tableData
                            .map(
                              (tableRow) => DataRow(cells: [
                                DataCell(
                                  Text(tableRow['clientName'].toString()),
                                ),
                                DataCell(
                                  Text(tableRow['name'].toString()),
                                ),
                                DataCell(
                                  Text(tableRow['poStatus'].toString()),
                                ),
                                DataCell(
                                  Text(tableRow['invStatus'].toString()),
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
          'Quotations',
          QuotationsPendingExpanded(tableData),
        );
      },
    );
  }

  void _openUploadDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          'Upload Quotation Details',
          QuotationsUpload(closeDialog),
        );
      },
    );
  }
}
