
import 'package:admin/routes/routes.dart';
import 'package:flutter/material.dart';

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
    default:
      return _getPageRoute(const Attendance());
  }
}

PageRoute _getPageRoute(Widget child){
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}