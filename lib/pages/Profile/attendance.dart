import 'package:admin/constants/style.dart';
import 'package:admin/widget/attendance_history.dart';
import 'package:admin/widget/custom_alert_dialog.dart';
import 'package:admin/widget/custom_text.dart';
import 'package:admin/widget/employee_attendance.dart';
import 'package:admin/widget/employee_attendance_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
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
              child: _viewButton(),
            ),
            Container(
              margin: const EdgeInsets.only(right: 35.0, top: 35.0),
              child: _uploadButton(),
            ),
          ],
        ),
        const SizedBox(height: 30),
        EmployeeAttendance(),
      ]),
    );
  }

  void _openUploadDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog('Upload Attendance Details', EmployeeAttendanceForm(),);
      },
    );
  }

  void _openViewDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog('Attendance History', AttendanceHistoryScreen());
      },
    );
  }

  Widget _uploadButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        backgroundColor: themeColor,
      ),
      onPressed: _openUploadDialog,
      child: const Text('Upload Attendance',
          style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _viewButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        backgroundColor: themeColor,
      ),
      onPressed: _openViewDialog,
      child: const Text('View Attendance',
          style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
