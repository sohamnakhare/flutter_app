class User {
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

  User(String name, String accountNumber, String location,
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
      String visitTimeSlot]) {
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
    this.visitTimeSlot = visitTimeSlot;
  }

  static getUsers() {
    return [
      User(
          "Piyush",
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
          "231234"),
      User(
          "Piyush",
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
          "231234"),
      User(
          "Piyush",
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
          "231234"),
      User(
          "Piyush",
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
          "231234"),
      User(
          "Piyush",
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
          "231234"),
      User(
          "Piyush",
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
          "231234"),
      User(
          "Piyush",
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
          "231234"),
      User(
          "Piyush",
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
          "231234"),
      User(
          "Piyush",
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
          "231234"),
    ];
  }
}
