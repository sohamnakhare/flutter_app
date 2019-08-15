class Account {
  String name;
  String location;
  String accountNumber;
  String allocatedBy;
  String product;
  String residenceAddress;
  String officeAddress;
  String mobileNumber;
  String tad;
  String officePhoneNumber;
  String email;
  String mad;
  String loanNumber;
  String visitTimeSlot;
  String receiptNumber;

  Account(String name, String accountNumber, String location,
      [String allocatedBy = "",
      String product = "",
      String residenceAddress = "",
      String officeAddress = "",
      String mobileNumber = "",
      String tad = "",
      String officePhoneNumber = "",
      String email = "",
      String mad = "",
      String loanNumber = "",
      String visitTimeSlot,
      String receiptNumber]) {
    this.name = name;
    this.accountNumber = accountNumber;
    this.location = location;
    this.allocatedBy = allocatedBy;
    this.product = product;
    this.residenceAddress = residenceAddress;
    this.officeAddress = officeAddress;
    this.mobileNumber = mobileNumber;
    this.tad = tad;
    this.officePhoneNumber = officePhoneNumber;
    this.email = email;
    this.mad = mad;
    this.loanNumber = loanNumber;
    this.receiptNumber = receiptNumber;
  }

  static getAccounts() {
    return [
      Account(
          "Piyush",
          "PUN00000013980802",
          "Viman Nagar",
          "Nilesh",
          "Product",
          "residence address",
          "office address",
          "8162541329",
          "1234567.00",
          "02067154132",
          "nilesh@gmail.com",
          "1234567.00",
          "231234",
          "12341231",
          "12341231"),
      Account(
          "Suresh",
          "PUN00000013980802",
          "Viman Nagar",
          "Nilesh",
          "Product",
          "residence address",
          "office address",
          "8162541727",
          "1234567.00",
          "02067154132",
          "nilesh@gmail.com",
          "1234567.00",
          "231234",
          "12341231"),
      Account(
          "Ramesh",
          "PUN00000013980802",
          "Viman Nagar",
          "Nilesh",
          "Product",
          "residence address",
          "office address",
          "9862541327",
          "1234567.00",
          "02067154132",
          "nilesh@gmail.com",
          "1234567.00",
          "231234",
          "12341231"),
      Account(
          "Prashant",
          "PUN00000013980802",
          "Viman Nagar",
          "Nilesh",
          "Product",
          "residence address",
          "office address",
          "9762541327",
          "1234567.00",
          "02067154132",
          "nilesh@gmail.com",
          "1234567.00",
          "231234",
          "12341231"),
      Account(
          "Shrikant",
          "PUN00000013980802",
          "Viman Nagar",
          "Nilesh",
          "Product",
          "residence address",
          "office address",
          "7762541327",
          "1234567.00",
          "02067154132",
          "nilesh@gmail.com",
          "1234567.00",
          "231234",
          "12341231"),
      Account(
          "John",
          "PUN00000013980802",
          "Viman Nagar",
          "Nilesh",
          "Product",
          "residence address",
          "office address",
          "8162541327",
          "1234567.00",
          "02067154132",
          "nilesh@gmail.com",
          "1234567.00",
          "231234",
          "12341231"),
      Account(
          "Sachin",
          "PUN00000013980802",
          "Viman Nagar",
          "Nilesh",
          "Product",
          "residence address",
          "office address",
          "8162541378",
          "1234567.00",
          "02067154132",
          "nilesh@gmail.com",
          "1234567.00",
          "231234",
          "12341231"),
      Account(
          "Rahul",
          "PUN00000013980802",
          "Viman Nagar",
          "Nilesh",
          "Product",
          "residence address",
          "office address",
          "8189541327",
          "1234567.00",
          "02067154132",
          "nilesh@gmail.com",
          "1234567.00",
          "231234",
          "12341231"),
      Account(
          "Wasim",
          "PUN00000013980802",
          "Viman Nagar",
          "Nilesh",
          "Product",
          "residence address",
          "office address",
          "8172441327",
          "1234567.00",
          "02067154132",
          "nilesh@gmail.com",
          "1234567.00",
          "231234",
          "12341231"),
    ];
  }

  static filterAccounts(String query) {
    List<Account> accounts = getAccounts();
    if (query.isEmpty || query == "") {
      return accounts;
    }
    return accounts.where((account) {
      return account.name.contains(query) ||
          account.mobileNumber.contains(query) ||
          account.loanNumber.contains(query);
    }).toList();
  }
}
