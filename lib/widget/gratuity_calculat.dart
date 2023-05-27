import 'package:admin/models/empMaster.dart';
import 'package:admin/utils/common_utils.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../api.dart';

class GratuityCalculateWidget extends StatefulWidget {
  dynamic closeDialog;
  List<EmpMaster> empDetails;
  List<Map<String, dynamic>> gratuityType;
  GratuityCalculateWidget(this.empDetails, this.gratuityType, this.closeDialog,
      {Key? key})
      : super(key: key);

  @override
  _GratuityCalculateWidgetState createState() =>
      _GratuityCalculateWidgetState();
}

class _GratuityCalculateWidgetState extends State<GratuityCalculateWidget> {
  final empCtrl = TextEditingController();
  final typCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 70),
            child: getCustomCard(SizedBox(
              width: 830,
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                        width: 100,
                        height: 40,
                        // child: dropDownField('Department'),
                        child: Center(child: Text('Employee :'))),
                    SizedBox(
                        width: 200,
                        height: 40,
                        // child: dropDownField('Department'),
                        child: CustomDropdown.search(
                            hintText: 'Search',
                            items: widget.empDetails
                                .map<String>((EmpMaster employee) {
                              return employee.name;
                            }).toList(),
                            controller: empCtrl,
                            onChanged: (val) async {
                              // if (data != null) {
                              //   ticketFor = await api.getTicketFor(data.id);
                              // }
                              setState(() {});
                            }
                            // },
                            )),
                    const SizedBox(
                        width: 100,
                        height: 40,
                        // child: dropDownField('Department'),
                        child: Center(child: Text('Type :'))),
                    SizedBox(
                        width: 200,
                        height: 40,
                        // child: dropDownField('Department'),
                        child: CustomDropdown(
                            hintText: 'Select Type',
                            items: widget.gratuityType
                                .map<String>((Map<String, dynamic> type) {
                              return (type['description']);
                            }).toList(),
                            controller: typCtrl,
                            onChanged: (val) async {
                              setState(() {});
                            }
                            // },
                            )),
                    SizedBox(
                        width: 150,
                        height: 40,
                        // child: dropDownField('Department'),
                        child: ElevatedButton(
                          onPressed: () async {
                            var data = widget.empDetails
                                .firstWhere((e) => e.name == empCtrl.text);
                            var typeData = widget.gratuityType.firstWhere(
                                (e) => e['description'] == typCtrl.text);
                            var status = await saveGratuity(
                                data.empCode.toString(),
                                typeData['id'].toString(),
                                '1');
                            if (status) {
                              Fluttertoast.showToast(
                                msg: "Saved",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                                webPosition: "center",
                                webShowClose: false,
                              );
                              widget.closeDialog();
                            }
                          },
                          child: Row(
                            // mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.calculate),
                              SizedBox(width: 8.0),
                              Text('Calculate'),
                            ],
                          ),
                        ))
                  ]),
            ))));
  }
}
