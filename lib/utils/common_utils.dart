import 'package:admin/models/userPrivileges.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../constants/style.dart';

String getDateStringFromDateTime(DateTime dateTime) {
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

List<Widget> getActionButtonsForExpandedView({
    required BuildContext context,
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
