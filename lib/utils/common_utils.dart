import 'package:admin/models/userPrivileges.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import '../constants/style.dart';

String yyyyMMddFromDateTime(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd').format(dateTime);
}

Card getCustomCard(Widget child) {
  return Card(
    elevation: 8.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    shadowColor: shadowColor,
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
    child: Padding(padding: const EdgeInsets.all(8.0), child: child),
  );
}

bool getViewPrivilege(UserPrivileges privileges) {
  return privileges.viewPrivilege == true ? true : false;
}

List<Widget> getActionButtonsWithoutPrivilege(
    {required BuildContext context,
    required void Function() onSubmit,
    bool hasDeleteOption = false,
    void Function()? onDelete}) {
  List<Widget> widgetList = [
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: themeColor,
      ),
      onPressed: onSubmit,
      child: const Text('Submit'),
    ),
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: themeColor,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('Cancel'),
    ),
  ];
  if (hasDeleteOption) {
    widgetList.add(
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeColor,
        ),
        onPressed: onDelete,
        child: const Text('Delete'),
      ),
    );
  }
  return widgetList;
}

List<Widget> getActionButtonsWithPrivilege(
    {required BuildContext context,
    required UserPrivileges privileges,
    required bool hasData,
    required void Function() onSubmit,
    required void Function() onDelete}) {
  List<Widget> widgetList = [
    if (privileges.editPrivilege)
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeColor,
        ),
        onPressed: onSubmit,
        child: const Text('Submit'),
      ),
    getThemedButton(
        buttonText: 'Cancel',
        onPressed: () {
          Navigator.of(context).pop();
        }),
  ];
  if (hasData && privileges.deletePrivilege) {
    widgetList.add(
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeColor,
        ),
        onPressed: onDelete,
        child: const Text('Delete'),
      ),
    );
  }
  return widgetList;
}

Widget getThemedButton({required String buttonText, Function()? onPressed}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: themeColor,
    ),
    onPressed: onPressed,
    child: Text(buttonText),
  );
}

void showSaveSuccessfulMessage(BuildContext context,
    [String message = "Save Successful"]) {
  if (Platform.isWindows) {
    final snackBar = SnackBar(
      content: Container(
          width: 200,
          child: Text(
            message,
            textAlign: TextAlign.center,
          )),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
      webPosition: "center",
      webShowClose: false,
    );
  }
}

void showSaveFailedMessage(BuildContext context,
    [String message = "Unable to save"]) {
  if (Platform.isWindows) {
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.redAccent,
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
      webPosition: "center",
      webShowClose: false,
    );
  }
}

class StatusEntity {
  int id = 0;
  String description = '';

  StatusEntity();

  StatusEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "0";
    description = json['description'] ?? '';
  }
}

List<StatusEntity> addBlankOption(List<StatusEntity> options) {
  StatusEntity blankOption = StatusEntity();
  return [blankOption, ...options];
}

Color getRowColor(DateTime docDate) {
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
