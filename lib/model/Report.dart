class Report {
  String parameter;
  int caseCount;
  double amount;
  int actual;
  int target;

  Report(this.parameter, this.caseCount, this.amount, this.actual, this.target);

  static getReport() {
    return [
      Report('RB', 10, 35000, 70, 70),
      Report('RF', 5, 45000, 20, 20),
      Report('Stab', 15, 15000, 10, 10),
      Report('Norm', 05, 10000, 30, 30),
    ];
  }
}