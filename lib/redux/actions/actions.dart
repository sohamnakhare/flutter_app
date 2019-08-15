import '../../model/Allocation.dart';
import '../../model/Payment.dart';
import '../../model/Activity.dart';


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
