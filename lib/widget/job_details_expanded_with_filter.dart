import 'package:admin/constants/style.dart';
import 'package:admin/widget/job_details_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api.dart';

class JobDetailsExpandedWithFilter extends StatefulWidget {
  @override
  State<JobDetailsExpandedWithFilter> createState() =>
      _JobDetailsExpandedWithFilterState();
}

class _JobDetailsExpandedWithFilterState
    extends State<JobDetailsExpandedWithFilter> {
  List<Map<String, dynamic>> tableData = <Map<String, String>>[];

  String _selectedJobStatus = '';
  String _selectedAssignedTo = '';
  String _selectedDueDate = '';

  getTableData() async {
    tableData = await getJobDetails(_selectedJobStatus, _selectedAssignedTo, _selectedDueDate);
  }

  applyFilter(String jobStatus, String assignedTo, String dueDate) {
    setState(() {
      _selectedJobStatus = jobStatus;
      _selectedAssignedTo = assignedTo;
      _selectedDueDate = dueDate;
      getTableData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: getTableData(),
        builder: (context, AsyncSnapshot<dynamic> _data) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text('Job Details'),
                      const SizedBox(width: 15),
                      IconButton(
                        onPressed: _openUploadDialog,
                        icon: const Icon(
                          Icons.filter_alt_sharp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    style: const ButtonStyle(alignment: Alignment.topRight),
                    onPressed: () {
                      navigator?.pop(context);
                    },
                    child: const Icon(
                      Icons.clear,
                      color: themeColor,
                    ),
                  ),
                ],
              ),
              content: SizedBox(
                height: 500,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
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
                              'Assigned Date',
                              style: tableHeaderStyle,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Status',
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
                      rows: tableData
                          .map(
                            (tableRow) => DataRow(cells: [
                          DataCell(
                            Text(tableRow['job'].toString()),
                          ),
                          DataCell(
                            Text(tableRow['narration'].toString()),
                          ),
                          DataCell(
                            Text(tableRow['assignedTo'].toString()),
                          ),
                          DataCell(
                            Text(tableRow['assignedDate'].toString()),
                          ),
                          DataCell(
                            Text(tableRow['jobStatus'].toString()),
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
              ),
              insetPadding: const EdgeInsets.symmetric(horizontal: 100),
            ),
          );
        });
  }

  void _openUploadDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(content: JobDetailsFilter(applyFilter));
      },
    );
  }
}
