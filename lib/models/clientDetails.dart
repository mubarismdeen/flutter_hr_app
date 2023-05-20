class ClientDetails {
  int id = 0;
  String name = '';
  String address = '';
  String mobile1 = '';
  String mobile2 = '';
  int editBy = 0;
  DateTime editDt = DateTime.now();
  int creatBy = 0;
  DateTime creatDt = DateTime.now();

  ClientDetails({
    required this.id,
    required this.name,
    required this.address,
    required this.mobile1,
    required this.mobile2,
    required this.editBy,
    required this.editDt,
    required this.creatBy,
    required this.creatDt,
  });

  ClientDetails.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['name']??'';
    address = json['address']??'';
    mobile1 = json['mobile1']??'';
    mobile2 = json['mobile2']??'';
    editBy = json['editBy']??0;
    editDt = DateTime.parse(json['editDt']);
    creatBy = json['creatBy']??0;
    creatDt = DateTime.parse(json['creatDt']);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'address': address,
    'mobile1': mobile1,
    'mobile2': mobile2,
    'editBy': editBy,
    'editDt': editDt.toIso8601String(),
    'creatBy': creatBy,
    'creatDt': creatDt.toIso8601String(),
  };
}
