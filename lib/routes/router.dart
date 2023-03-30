import 'dart:js';

import 'package:admin/routes/routes.dart';
import 'package:flutter/material.dart';

import '../pages/Authentication/authentication.dart';
import '../pages/Overviewpage/overviewpage.dart';
import '../pages/Prisoner_Details/salary.dart';
import '../pages/Profile/attendance.dart';
import '../pages/Transfers/dashboard.dart';



Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case OverViewPageRoute:
      return _getPageRoute(const OverViewPage());
    case AttendanceRoute:
      return _getPageRoute(const Attendance());
    case DashboardRoute:
      return _getPageRoute(const Dashboard());
    case SalaryRoute:
      return _getPageRoute(const Salary());
    case AuthenticationPageRoute:
      return _getPageRoute(const Authentication());
    default:
      return _getPageRoute(const Attendance());
  }
}

PageRoute _getPageRoute(Widget child){
  return MaterialPageRoute(builder: (context) => child);
}