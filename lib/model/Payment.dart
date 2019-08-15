class Payment {
  final int id;
  final double amount;
  final String paymentMode;
  final String payeeType;
  final String payeeRelation;
  final String payeeName;
  final String denomination;

  Payment(
      {this.id,
        this.amount,
        this.paymentMode,
        this.payeeType,
        this.payeeRelation,
        this.payeeName,
        this.denomination});

  factory Payment.fromJson(Map<String, dynamic> model) {
    return Payment(
        id: model['id'],
        amount: model['amount'],
        payeeName: model['payeeName'],
        paymentMode: model['paymentMode'],
        payeeType: model['payeeType'],
        payeeRelation: model['payeeRelation'],
        denomination: model['denomination']);
  }
}
