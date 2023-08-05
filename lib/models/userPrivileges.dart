class UserPrivileges {

  int id = 0;
  int userId = 0;
  String privilegeName = "";
  bool viewPrivilege = false;
  bool addPrivilege = false;
  bool editPrivilege = false;
  bool deletePrivilege = false;

  UserPrivileges();

  UserPrivileges.fromJson(Map<String, dynamic> json) {
    id =  json['id']??"0";
    userId =  json['userId']??"0";
    privilegeName =  json['privilegeName']??"";
    viewPrivilege =  json['viewPrivilege']??false;
    addPrivilege =  json['addPrivilege']??false;
    editPrivilege =  json['editPrivilege']??false;
    deletePrivilege =  json['deletePrivilege']??false;
  }

}
