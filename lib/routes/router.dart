
import 'package:admin/pages/Clients/clients_screen.dart';
import 'package:admin/pages/Employees/employees_screen.dart';
import 'package:admin/pages/Salary/leave_salary.dart';
import 'package:admin/pages/Salary/salary_payout.dart';
import 'package:admin/routes/routes.dart';
import 'package:flutter/material.dart';

import '../pages/Attendance/attendance.dart';
import '../pages/Gratuity/gratuity_screen.dart';
import '../pages/Salary/salary_master.dart';
import '../pages/Transfers/dashboard.dart';



Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case EmployeesRoute:
      return _getPageRoute(const EmployeesScreen());
    case AttendanceRoute:
      return _getPageRoute(const Attendance());
    case DashboardRoute:
      return _getPageRoute(const Dashboard());
    case SalaryMasterRoute:
      return _getPageRoute(const SalaryMaster());
    case SalaryPayoutRoute:
      return _getPageRoute(const SalaryPayout());
    case LeaveSalaryRoute:
      return _getPageRoute(const LeaveSalaryPage());
    case ClientsRoute:
      return _getPageRoute(const ClientsScreen());
    case GratuityRoute:
      return _getPageRoute(const GratuityScreen());
    default:
      return _getPageRoute(const Attendance());
  }
}

PageRoute _getPageRoute(Widget child){
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, -1.0);
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