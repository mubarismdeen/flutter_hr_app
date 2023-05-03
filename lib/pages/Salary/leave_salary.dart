import 'package:admin/constants/style.dart';
import 'package:admin/widget/custom_alert_dialog.dart';
import 'package:admin/widget/custom_text.dart';
import 'package:admin/widget/employee_salary_form.dart';
import 'package:admin/widget/employee_salary.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';

class LeaveSalary extends StatefulWidget {
  const LeaveSalary({Key? key}) : super(key: key);

  @override
  State<LeaveSalary> createState() => _LeaveSalaryState();
}

class _LeaveSalaryState extends State<LeaveSalary> {

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
        const SizedBox(height: 20),
        EmployeeSalary(),
      ]),
    );
  }

}
