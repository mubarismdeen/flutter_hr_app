
class DocDetails {
  int id = 0;
  String narration = "";
  int empCode = 0;
  int docid = 0;
  DateTime dueDate = DateTime.now();
  DateTime renewedDate = DateTime.now();
  int creatBy = 0;
  DateTime creatDt = DateTime.now();
  int editBy = 0;
  DateTime editDt = DateTime.now();

  DocDetails({
    required this.id,
    required this.narration,
    required this.empCode,
    required this.docid,
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
        'empCode': empCode,
        'docid': docid,
        'dueDate': dueDate.toIso8601String(),
        'renewedDate':renewedDate.toIso8601String(),
        'creatBy':creatBy,
        'creatDt':creatDt.toIso8601String(),
        'editBy':editBy,
        'editDt':editDt.toIso8601String(),
      };

  DocDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    narration = json['narration'] ?? "";
    empCode = json['empCode'] ?? 0;
    docid = json['docid'] ?? 0;
    dueDate = json['dueDate'] ?? DateTime.now();
    renewedDate = json['renewedDate'] ?? DateTime.now();
    creatBy = json['creatBy'] ?? 0;
    creatDt = json['creatDt'] ?? DateTime.now();
    editBy = json['editBy'] ?? 0;
    editDt = json['editDt'] ?? DateTime.now();
    // docDate = json['h_DocDt'] == null ?  DateTime.now() : DateTime.tryParse(json['h_DocDt'])??DateTime.now();
  }
}