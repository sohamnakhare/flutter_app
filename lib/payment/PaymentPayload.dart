import '../model/Allocation.dart';

class PaymentPayload {
  final int allocDetailId;
  final double amount;
  final String paymentMode;
  final String payeeType;
  final String payeeRelation;
  final String payeeName;
  final String denomination;
  final Allocation allocDetail;

  PaymentPayload(
      {this.allocDetailId,
      this.amount,
      this.paymentMode,
      this.payeeType,
      this.payeeRelation,
      this.payeeName,
      this.denomination,
      this.allocDetail});

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["allocDetailId"] = allocDetailId.toString();
    map["amount"] = amount.toString();
    map["paymentMode"] = paymentMode;
    map["payeeType"] = payeeType;
    map["payeeRelation"] = payeeRelation;
    map["payeeName"] = payeeName;
    map["denomination"] = denomination;

    return map;
  }
}
