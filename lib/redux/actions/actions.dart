import '../../model/Allocation.dart';
import '../../model/Payment.dart';
import '../../model/Activity.dart';
import '../../model/PTP.dart';
import '../../model/Report.dart';


class StoreMobileNumber {
  final String mobileNumber;

  StoreMobileNumber(this.mobileNumber);
}

class StoreAuthToken {
  final String authToken;

  StoreAuthToken(this.authToken);
}

class StoreAllocations {
  final List<Allocation> allocations;

  StoreAllocations(this.allocations);
}

class StoreSelectedAllocation {
  final Allocation allocation;

  StoreSelectedAllocation(this.allocation);
}

class StoreAllocationPayment {
  final Payment payment;

  StoreAllocationPayment(this.payment);
}

class StoreActivities {
  final List<Activity> activities;

  StoreActivities(this.activities);
}

class StorePTPs {
  final List<PTP> ptps;

  StorePTPs(this.ptps);
}

class StoreSelectedPTPFilter {
  final String selectedPTPFilter;

  StoreSelectedPTPFilter(this.selectedPTPFilter);
}

class StoreProducts {
  final List<String> products;

  StoreProducts(this.products);
}

class StoreSelectedProduct {
  final String selectedProduct;

  StoreSelectedProduct(this.selectedProduct);
}

class StoreReport {
  final Report report;

  StoreReport(this.report);
}