import 'package:admin/constants/style.dart';
import 'package:admin/utils/common_utils.dart';
import 'package:admin/widget/custom_alert_dialog.dart';
import 'package:admin/widget/custom_text.dart';
import 'package:admin/widget/job_details_expanded_with_filter.dart';
import 'package:admin/widget/job_details_upload.dart';
import 'package:flutter/material.dart';

import '../api.dart';
import 'package:intl/intl.dart';

class JobDetailsWidget extends StatefulWidget {
  @override
  _JobDetailsWidgetState createState() => _JobDetailsWidgetState();
}

class _JobDetailsWidgetState extends State<JobDetailsWidget> {
  List<Map<String, dynamic>> tableData = <Map<String, String>>[];

  getData() async {
    tableData = await getJobDetails('', '', '');
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
          return getCustomCard(
            Column(
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
                      text: "Job Details",
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
                              'Job',
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
                              'Assigned To',
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
                                color: MaterialStateColor.resolveWith(
                                    (states) => _getRowColor(
                                        DateTime.parse(tableRow['dueDate']))),
                                cells: [
                                  DataCell(
                                    Text(tableRow['job']),
                                  ),
                                  DataCell(
                                    Text(tableRow['narration']),
                                  ),
                                  DataCell(
                                    Text(tableRow['assignedTo']),
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
                              fontWeight: FontWeight.bold, color: themeColor)),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Color _getRowColor(DateTime docDate) {
    DateTime today = DateTime.now();
    int differenceInDays = docDate.difference(today).inDays;
    Color rowColor = Colors.transparent;
    if (differenceInDays < 0) {
      rowColor = Colors.red.shade300;
    } else if (differenceInDays < 10) {
      rowColor = Colors.orange.shade200;
    }
    return rowColor;
  }

  void _openViewDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return CustomAlertDialog(
        //   'Job Details',
        //   JobDetailsExpanded(tableData: tableData),
        // );
        return JobDetailsExpandedWithFilter();
      },
    );
  }

  void _openUploadDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          'Upload Job Details',
          JobDetailsUpload(closeDialog),
        );
      },
    );
  }
}
