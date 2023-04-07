
class DocDetails {
  int id = 0;
  String narration = "NULL";
  String docType = "NULL";
  DateTime dueDate = DateTime.now();
  DateTime renewedDate = DateTime.now();
  String creatBy = "NULL";
  DateTime creatDt = DateTime.now();
  String editBy = "NULL";
  DateTime editDt = DateTime.now();

  DocDetails({
    required this.id,
    required this.narration,
    required this.docType,
    required this.dueDate,
    required this.renewedDate,
    required this.creatBy,
    required this.creatDt,
    required this.editBy,
    required this.editDt,
  });

  DocDetails.toJson();

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'narration': narration,
        'docType': docType,
        'dueDate': dueDate,
        'renewedDate':renewedDate,
        'creatBy':creatBy,
        'creatDt':creatDt,
        'editBy':editBy,
        'editDt':editDt,
      };

  DocDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "NULL";
    narration = json['narration'] ?? "narration";
    docType = json['docType'] ?? "NULL";
    dueDate = json['dueDate'] ?? "dueDate";
    renewedDate = json['renewedDate'] ?? "NULL";
    creatBy = json['creatBy'] ?? "NULL";
    creatDt = json['creatDt'] ?? DateTime.now();
    editBy = json['editBy'] ?? "NULL";
    editDt = json['editDt'] ?? DateTime.now();
    // docDate = json['h_DocDt'] == null ?  DateTime.now() : DateTime.tryParse(json['h_DocDt'])??DateTime.now();
  }
}