
class QuotationDetails {
  int id = 0;
  String quotation = "NULL";
  String company = "NULL";
  String state = "NULL";
  String creatBy = "NULL";
  DateTime creatDt = DateTime.now();
  String editBy = "NULL";
  DateTime editDt = DateTime.now();

  QuotationDetails({
    required this.id,
    required this.quotation,
    required this.company,
    required this.state,
    required this.creatBy,
    required this.creatDt,
    required this.editBy,
    required this.editDt,
  });

  QuotationDetails.toJson();

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'narration': quotation,
        'docType': company,
        'dueDate': state,
        'creatBy':creatBy,
        'creatDt':creatDt,
        'editBy':editBy,
        'editDt':editDt,
      };

  QuotationDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "NULL";
    quotation = json['narration'] ?? "narration";
    company = json['docType'] ?? "NULL";
    state = json['dueDate'] ?? "dueDate";
    creatBy = json['creatBy'] ?? "NULL";
    creatDt = json['creatDt'] ?? DateTime.now();
    editBy = json['editBy'] ?? "NULL";
    editDt = json['editDt'] ?? DateTime.now();
    // docDate = json['h_DocDt'] == null ?  DateTime.now() : DateTime.tryParse(json['h_DocDt'])??DateTime.now();
  }
}