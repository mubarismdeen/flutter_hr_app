import 'package:admin/constants/style.dart';
import 'package:admin/widget/custom_alert_dialog.dart';
import 'package:admin/widget/custom_text.dart';
import 'package:admin/widget/employee_salary_form.dart';
import 'package:admin/widget/employee_salary_master.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';

class SalaryMaster extends StatefulWidget {
  const SalaryMaster({Key? key}) : super(key: key);

  @override
  State<SalaryMaster> createState() => _SalaryMasterState();
}

class _SalaryMasterState extends State<SalaryMaster> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Obx(() => Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6,
                  left: 10),
              child: CustomText(
                text: menuController.activeItem.value,
                size: 24,
                weight: FontWeight.bold,
                color: Colors.black,
              ),
            )
          ],
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 35.0, top: 35.0),
              child: _uploadButton(),
            ),
          ],
        ),
        EmployeeSalaryMaster(),
      ]),
    );
  }

  void _openDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog('Upload Salary Details', const EmployeeSalaryForm(),);
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
      child: const Text('Upload Salary', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

}
