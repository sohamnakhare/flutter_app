import 'package:meta/meta.dart';
import '../../model/Allocation.dart';
import '../../model/Payment.dart';
import '../../model/Activity.dart';

@immutable
class AllocationState {
  final List<Allocation> allocations;
  final Allocation selectedAllocation;
  final Payment allocationPayment;
  final List<Activity> activities;

  AllocationState(
      {this.allocations,
      this.selectedAllocation,
      this.allocationPayment,
      this.activities});

  AllocationState copyWith(
      {List<Allocation> allocations,
      Allocation selectedAllocation,
      Payment allocationPayment,
      List<Activity> activities}) {
    return new AllocationState(
        allocations: allocations ?? this.allocations,
        selectedAllocation: selectedAllocation ?? this.selectedAllocation,
        allocationPayment: allocationPayment ?? this.allocationPayment,
        activities: activities ?? this.activities);
  }

  factory AllocationState.initial() {
    return AllocationState(
        allocations: <Allocation>[],
        selectedAllocation: Allocation(),
        allocationPayment: Payment(),
        activities: <Activity>[]);
  }
}
