class Report {
  final num allocatedCount;
  final num collectedCount;
  final num allocatedAmount;
  final num collectedAmount;

  Report(
      {this.allocatedCount,
      this.collectedAmount,
      this.allocatedAmount,
      this.collectedCount});

  factory Report.fromJson(Map<String, dynamic> model) {
    return Report(
        allocatedCount: model["allocatedCount"],
        collectedAmount: model["collectedAmount"],
        allocatedAmount: model["allocatedAmount"],
        collectedCount: model["collectedCount"]);
  }
}
