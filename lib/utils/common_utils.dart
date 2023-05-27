import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../constants/style.dart';

String getDateStringFromDateTime(DateTime dateTime){
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
      child:Padding(
      padding: const EdgeInsets.all(8.0),
      child: child),
  );
}