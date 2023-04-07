import 'package:admin/constants/style.dart';
import 'package:admin/widget/custom_text.dart';
import 'package:admin/widget/employee_salary_form.dart';
import 'package:admin/widget/employee_salary.dart';
import 'package:admin/widget/employee_attendance_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';

class Salary extends StatefulWidget {
  const Salary({Key? key}) : super(key: key);

  @override
  State<Salary> createState() => _SalaryState();
}

class _SalaryState extends State<Salary> {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
      Expanded(
        child: EmployeeSalary(),
      ),
    ]);
  }

  void _openDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Upload Salary Details'),
          content: EmployeeSalaryForm(),
          insetPadding: const EdgeInsets.symmetric(horizontal: 100),
        );
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
