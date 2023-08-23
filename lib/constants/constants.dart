enum Screen {
  Dashboard,
  Employees,
  Attendance,
  SalaryMaster,
  SalaryPayout,
  LeaveSalary,
  Clients,
  Gratuity,
}

extension ScreenExtension on Screen {
  String get value {
    switch (this) {
      case Screen.Dashboard:
        return "Dashboard";
      case Screen.Employees:
        return "Employees";
      case Screen.Attendance:
        return "Attendance";
      case Screen.SalaryMaster:
        return "Salary Master";
      case Screen.SalaryPayout:
        return "Salary Payout";
      case Screen.LeaveSalary:
        return "Leave Salary";
      case Screen.Clients:
        return "Clients";
      case Screen.Gratuity:
        return "Gratuity";
    }
  }
}