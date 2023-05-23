import 'package:admin/api.dart';
import 'package:admin/constants/style.dart';
import 'package:admin/models/clientDetails.dart';
import 'package:admin/models/empMaster.dart';
import 'package:admin/models/gratuityDetails.dart';
import 'package:admin/widget/client_details_form.dart';
import 'package:admin/widget/custom_alert_dialog.dart';
import 'package:admin/widget/custom_text.dart';
import 'package:admin/widget/gratuity_calculat.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';
import '../../widget/client_details.dart';
import '../../widget/gratuity_details.dart';

class GratuityScreen extends StatefulWidget {
  const GratuityScreen({Key? key}) : super(key: key);

  @override
  State<GratuityScreen> createState() => _GratuityScreenState();
}

class _GratuityScreenState extends State<GratuityScreen> {
  // List<GratuityDetails> _gratuityDetails = List<GratuityDetails>.empty();
  List<Map<String, dynamic>> _gratuityDetails =  <Map<String, dynamic>>[];
  List<EmpMaster> _empDetails = List<EmpMaster>.empty();
  List<Map<String, dynamic>> _gratuityType = <Map<String, dynamic>>[];

  getTableData() async {
    _empDetails = await getEmpDetails();
    _gratuityType = await getGratuityType();
    _gratuityDetails = await getGratuityDetails();
  }

  closeDialog() {
    setState(() {
      getTableData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: getTableData(),
        builder: (context, AsyncSnapshot<dynamic> _data) {
          if (_data.connectionState == ConnectionState.waiting) {
            return const Center(child:SizedBox(width:25,height:25,child: CircularProgressIndicator()));
          } else if (_data.hasError) {
            return Text('Error: ${_data.error}');
          } else {
            return Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Obx(() =>
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: ResponsiveWidget.isSmallScreen(context)
                                      ? 56
                                      : 26,
                                  left: 23),
                              child: CustomText(
                                text: menuController.activeItem.value,
                                size: 24,
                                weight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ],
                        )),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Container(
                    //       margin: const EdgeInsets.only(right: 35.0, top: 35.0),
                    //       child: _uploadButton(),
                    //     ),
                    //   ],
                    // ),
                    GratuityCalculateWidget(_empDetails, _gratuityType,closeDialog),
                    GratuityDetailsWidget(_gratuityDetails,closeDialog),
                  ]),
                ));
          }
        });
  }

  void _openDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog('Add New', ClientDetailsForm(closeDialog));
      },
    );
  }

  Widget _uploadButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        backgroundColor: themeColor,
      ),
      onPressed: _openDialog,
      child: const Text('Add Client',
          style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
