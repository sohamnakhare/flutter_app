class PTP {
  int id;
  int allocDetailId;
  String activity;
  String dispositionCode;
  String remarks;
  String ptpDate;
  String customerName;
  String accountNo;

  PTP(this.id, this.allocDetailId, this.activity, this.dispositionCode,
      this.remarks, this.ptpDate, this.customerName, this.accountNo);

  factory PTP.fromJson(Map<String, dynamic> model) {
    return PTP(
        model["id"],
        model["allocDetailId"],
        model["activity"],
        model["dispositionCode"],
        model["remarks"],
        model["ptpDate"],
        "Piyush Bhandari",
        "987641523");
  }
}
