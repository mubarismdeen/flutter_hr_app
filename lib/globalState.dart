import 'package:admin/models/userScreens.dart';
import 'package:admin/routes/routes.dart';

class GlobalState {

  static String username = "User";
  static bool dashboardScreenPrivilege = false;
  static bool employeeScreenPrivilege = false;
  static bool attendanceScreenPrivilege = false;
  static bool salaryMasterScreenPrivilege = false;
  static bool salaryPayoutScreenPrivilege = false;
  static bool leaveSalaryScreenPrivilege = false;
  static bool clientsScreenPrivilege = false;
  static bool gratuityScreenPrivilege = false;

  static List<String> sideMenuItems =[];

  static void setScreensForUser(String givenUsername, UserScreens screensForUser) {
    username = givenUsername;
    sideMenuItems = [];
    if(screensForUser.dashboard) {
      dashboardScreenPrivilege = true;
      sideMenuItems.add(DashboardRoute);
    }
    if(screensForUser.employees) {
      employeeScreenPrivilege = true;
      sideMenuItems.add(EmployeesRoute);
      }
    if(screensForUser.attendance) {
      attendanceScreenPrivilege = true;
      sideMenuItems.add(AttendanceRoute);
    }
    if(screensForUser.salaryMaster) {
      salaryMasterScreenPrivilege = true;
      sideMenuItems.add(SalaryMasterRoute);
    }
    if(screensForUser.salaryPayout) {
      salaryPayoutScreenPrivilege = true;
      sideMenuItems.add(SalaryPayoutRoute);
    }
    if(screensForUser.leaveSalary) {
      leaveSalaryScreenPrivilege = true;
      sideMenuItems.add(LeaveSalaryRoute);
    }
    if(screensForUser.clients) {
      clientsScreenPrivilege = true;
      sideMenuItems.add(ClientsRoute);
    }
    if(screensForUser.gratuity) {
      gratuityScreenPrivilege = true;
      sideMenuItems.add(GratuityRoute);
    }
    sideMenuItems.add(AuthenticationPageRoute);
  }

}