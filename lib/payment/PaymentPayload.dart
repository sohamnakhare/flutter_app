import '../model/Allocation.dart';

class PaymentPayload {
  final int allocDetailId;
  final String accountNumber;
  final double amount;
  final String paymentMode;
  final String payeeType;
  final String payeeRelation;
  final String payeeName;
  final String denomination;
  final String product;
  final String dataSource;

  PaymentPayload(
      {this.allocDetailId,
        this.accountNumber,
      this.amount,
      this.paymentMode,
      this.payeeType,
      this.payeeRelation,
      this.payeeName,
      this.denomination,
      this.product,
      this.dataSource});

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["allocDetailId"] = allocDetailId.toString();
    map["amount"] = amount.toString();
    map["paymentMode"] = paymentMode;
    map["payeeType"] = payeeType;
    map["payeeRelation"] = payeeRelation;
    map["payeeName"] = payeeName;
    map["denomination"] = denomination;
    //map["fileStorageId"] = 0;
    map["product"] = product;
    map["dataSource"] = dataSource;
    map["accountNo"] = accountNumber;
    map["paymentDate"]  = DateTime.now().toIso8601String();

    return map;
  }
}
