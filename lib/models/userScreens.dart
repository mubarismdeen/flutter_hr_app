class UserScreens {
  int id = 0;
  int userId = 0;
  bool dashboard = false;
  bool employees = false;
  bool attendance = false;
  bool salaryMaster = false;
  bool salaryPayout = false;
  bool leaveSalary = false;
  bool clients = false;
  bool gratuity = false;

  UserScreens();

  UserScreens.fromJson(Map<String, dynamic> json) {
    id =  json['id']??"0";
    userId =  json['userId']??"0";
    dashboard =  json['dashboard']??false;
    employees =  json['employees']??false;
    attendance =  json['attendance']??false;
    salaryMaster =  json['salaryMaster']??false;
    salaryPayout =  json['salaryPayout']??false;
    leaveSalary =  json['leaveSalary']??false;
    clients =  json['clients']??false;
    gratuity =  json['gratuity']??false;
  }

}
