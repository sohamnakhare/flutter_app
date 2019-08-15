class Activity {
  final int id;
  final String activity;
  final String dispositionCode;
  final String remarks;
  final String updatedAt;
  final String ptpDate;

  Activity(
      {this.id,
      this.activity,
      this.dispositionCode,
      this.ptpDate,
      this.remarks,
      this.updatedAt});

  factory Activity.fromJson(Map<String, dynamic> model) {
    return Activity(
        id: model['id'],
        activity: model['activity'],
        dispositionCode: model['dispositionCode'],
        remarks: model['remarks'],
        updatedAt: model['updatedAt'],
        ptpDate: model['ptpDate']);
  }
}
