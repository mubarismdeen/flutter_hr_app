import 'package:admin/widget/custom_text.dart';
import 'package:admin/widget/employee_salary.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';
import '../../widget/month_picker.dart';

class SalaryPayout extends StatefulWidget {
  const SalaryPayout({Key? key}) : super(key: key);

  @override
  State<SalaryPayout> createState() => _SalaryPayoutState();
}

class _SalaryPayoutState extends State<SalaryPayout> {

  DateTime _pickedDate = DateTime.now();
  void onDateChange(DateTime newDate) {
    setState(() {
      _pickedDate = newDate;
    });
  }


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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 25.0, top: 35.0),
              child: MonthPicker(_pickedDate, onDateChange),
            ),
          ],
        ),
        const SizedBox(height: 15),
        EmployeeSalary(_pickedDate),
      ]),
    );
  }

}
