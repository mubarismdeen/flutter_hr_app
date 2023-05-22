import 'package:admin/constants/style.dart';
import 'package:admin/models/clientDetails.dart';
import 'package:admin/models/gratuityDetails.dart';
import 'package:admin/utils/common_utils.dart';
import 'package:flutter/material.dart';

class GratuityDetailsWidget extends StatefulWidget {
  List<GratuityDetails> gratuityDetails;
  GratuityDetailsWidget(this.gratuityDetails, {Key? key}) : super(key: key);

  @override
  _GratuityDetailsWidgetState createState() => _GratuityDetailsWidgetState();
}

class _GratuityDetailsWidgetState extends State<GratuityDetailsWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 600),
        child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          shadowColor: shadowColor,
          margin: const EdgeInsets.only(top: 20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Employee Code',
                              style: tableHeaderStyle,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Employee Name',
                              style: tableHeaderStyle,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Served Years',
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
                              'Gratuity Amount',
                              style: tableHeaderStyle,
                            ),
                          ),
                        ),
                        // DataColumn(
                        //   label: Expanded(
                        //     child: Text(
                        //       'Edited By',
                        //       style: tableHeaderStyle,
                        //     ),
                        //   ),
                        // ),
                        // DataColumn(
                        //   label: Expanded(
                        //     child: Text(
                        //       'Edited Date',
                        //       style: tableHeaderStyle,
                        //     ),
                        //   ),
                        // ),
                        // DataColumn(
                        //   label: Expanded(
                        //     child: Text(
                        //       'Created By',
                        //       style: tableHeaderStyle,
                        //     ),
                        //   ),
                        // ),
                        // DataColumn(
                        //   label: Expanded(
                        //     child: Text(
                        //       'Created Date',
                        //       style: tableHeaderStyle,
                        //     ),
                        //   ),
                        // ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Payment',
                              style: tableHeaderStyle,
                            ),
                          ),
                        ),
                      ],
                      rows: widget.gratuityDetails
                          .map((gratuity) => DataRow(cells: [
                        DataCell(Text(gratuity.empCode)),
                        DataCell(Text(gratuity.name)),
                        DataCell(Text(gratuity.servedYears)),
                        DataCell(Text(gratuity.type)),
                        DataCell(Text(gratuity.gratuityAmount)),
                        DataCell(
                          gratuity.gratuityAmount == 0
                              ? const Icon(Icons.check_circle_outline, color: Colors.green,)
                              : TextButton(
                            onPressed: () => null,
                            child: const Text('Pay', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                          ),
                        ),
                        // DataCell(Text(gratuity.editBy.toString())),
                        // DataCell(Text(getDateStringFromDateTime(gratuity.editDt))),
                        // DataCell(Text(gratuity.creatBy.toString())),
                        // DataCell(Text(getDateStringFromDateTime(gratuity.creatDt))),
                      ]))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
