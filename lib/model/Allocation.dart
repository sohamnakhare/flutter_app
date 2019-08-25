class Allocation {
  final int id;
  final String customerName;
  final String accountNo;
  final String startDate;
  final String endDate;
  final String product;
  final double outstandingAmount;
  final String dataSource;
  final String allocStatus;
  final String accountStatus;
  final String policyName;
  final String currentQueue;
  final String allocatedUserName;
  final int allocatedFileDataId;

  Allocation(
      {this.id,
      this.customerName,
      this.accountNo,
      this.startDate,
      this.endDate,
      this.product,
      this.outstandingAmount,
      this.dataSource,
      this.accountStatus,
      this.allocatedFileDataId,
      this.allocatedUserName,
      this.allocStatus,
      this.currentQueue,
      this.policyName});

  factory Allocation.fromJson(Map<String, dynamic> model) {
    return Allocation(
        id: model['id'],
        customerName: model['customerName'],
        accountNo: model['accountNo'],
        startDate: model['startdate'],
        endDate: model['endDate'],
        product: model['product'],
        outstandingAmount: model['outstandingAmount'],
        dataSource: model['dataSource'],
        accountStatus: model['accountStatus'],
        allocatedFileDataId: model['allocatedFileDataId'],
        allocatedUserName: model['allocatedUserName'],
        allocStatus: model['allocStatus'],
        currentQueue: model['currentQueue'],
        policyName: model['policyName']);
  }
}
