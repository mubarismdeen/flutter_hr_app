
class QuotationDetails {
  int id = 0;
  String clientName = "";
  String narration = "";
  String name = "";
  String date = "";
  int quotationNo = 0;
  int invoiceNo = 0;
  int poStatus = 0;
  int invStatus = 0;
  int type = 0;
  int docId = 0;
  String dueDate = "";
  int creatBy = 0;
  DateTime creatDt = DateTime.now();
  int editBy = 0;
  DateTime editDt = DateTime.now();

  QuotationDetails({
    required this.id,
    required this.clientName,
    required this.narration,
    required this.name,
    required this.date,
    required this.quotationNo,
    required this.invoiceNo,
    required this.poStatus,
    required this.invStatus,
    required this.type,
    required this.docId,
    required this.dueDate,
    required this.creatBy,
    required this.creatDt,
    required this.editBy,
    required this.editDt,
  });

  QuotationDetails.toJson();

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'clientName': clientName,
        'narration': narration,
        'name': name,
        'date': date,
        'quotationNo': quotationNo,
        'invoiceNo': invoiceNo,
        'poStatus': poStatus,
        'invStatus': invStatus,
        'type': type,
        'docId': docId,
        'dueDate': dueDate,
        'creatBy':creatBy,
        'creatDt':creatDt.toIso8601String(),
        'editBy':editBy,
        'editDt':editDt.toIso8601String(),
      };

  // QuotationDetails.fromJson(Map<String, dynamic> json) {
  //   id = json['id'] ?? 0;
  //   narration = json['narration'] ?? "";
  //   quotationNo = json['empCode'] ?? 0;
  //   invoiceNo = json['docid'] ?? 0;
  //   dueDate = json['dueDate'] ?? DateTime.now();
  //   renewedDate = json['renewedDate'] ?? DateTime.now();
  //   creatBy = json['creatBy'] ?? 0;
  //   creatDt = json['creatDt'] ?? DateTime.now();
  //   editBy = json['editBy'] ?? 0;
  //   editDt = json['editDt'] ?? DateTime.now();
  //   // docDate = json['h_DocDt'] == null ?  DateTime.now() : DateTime.tryParse(json['h_DocDt'])??DateTime.now();
  // }
}