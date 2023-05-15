
class JobDetails {
  int id = 0;
  String job = "";
  String narration = "";
  String assignedDate = "";
  String dueDate = "";
  int jobStatus = 0;
  int assignedTo = 0;
  int creatBy = 0;
  DateTime creatDt = DateTime.now();
  int editBy = 0;
  DateTime editDt = DateTime.now();

  JobDetails({
    required this.id,
    required this.job,
    required this.narration,
    required this.assignedDate,
    required this.jobStatus,
    required this.assignedTo,
    required this.dueDate,
    required this.creatBy,
    required this.creatDt,
    required this.editBy,
    required this.editDt,
  });

  JobDetails.toJson();

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'job': job,
        'narration': narration,
        'assignedDate': assignedDate,
        'jobStatus': jobStatus,
        'assignedTo': assignedTo,
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