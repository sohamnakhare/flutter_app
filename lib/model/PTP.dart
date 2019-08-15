class PTP {
  String accountName;
  String accountNumber;
  List<String> timeSlot;

  PTP(this.accountName, this.accountNumber, this.timeSlot);

  static List<PTP> getPTPs() {
    return [
      PTP("Piyush", "PUN00000013980802", ["5 Jul", "09:30 am"]),
      PTP("Suresh", "PUN00000013980802", ["5 Jul", "09:30 am"]),
      PTP("Ramesh", "PUN00000013980802", ["5 Jul", "09:30 am"]),
      PTP("John", "PUN00000013980802", ["5 Jul", "09:30 am"]),
      PTP("Wasim", "PUN00000013980802", ["5 Jul", "09:30 am"]),
      PTP("Radha", "PUN00000013980802", ["5 Jul", "09:30 am"]),
      PTP("Rohit", "PUN00000013980802", ["5 Jul", "09:30 am"]),
      PTP("Sumit", "PUN00000013980802", ["5 Jul", "09:30 am"]),
    ];
  }
}
