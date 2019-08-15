class ActivityPayload {
  int allocDetailId;
  final String activity;
  final String dispositionCode;
  final String remarks;
  final DateTime ptpDate;

  ActivityPayload(
      {this.allocDetailId, this.activity, this.dispositionCode, this.ptpDate, this.remarks});

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["allocDetailId"] = allocDetailId;
    map["activity"] = activity;
    map["dispositionCode"] = dispositionCode;
    map["remarks"] = remarks;
    if(ptpDate != null) {
      map["ptpDate"] = ptpDate.toIso8601String();
    }
    return map;
  }
}
