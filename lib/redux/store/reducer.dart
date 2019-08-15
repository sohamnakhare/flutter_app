import './AuthState.dart';
import './AppState.dart';
import './AllocationState.dart';
import 'package:flutter_app/redux/actions/actions.dart';

AppState appReducer(AppState state, dynamic action) => new AppState(
    authState: authReducer(state.authState, action),
    allocState: allocReducer(state.allocState, action));

AuthState authReducer(AuthState state, action) {
  if (action is AuthState) {
    return action;
  }

  if (action is StoreMobileNumber) {
    return AuthState(mobileNumber: action.mobileNumber);
  }

  if (action is StoreAuthToken) {
    return AuthState(mobileNumber: state.mobileNumber, token: action.authToken);
  }

  return state;
}

AllocationState allocReducer(AllocationState state, action) {
  if (action is StoreAllocations) {
    return AllocationState(allocations: action.allocations);
  }

  if (action is StoreSelectedAllocation) {
    return AllocationState(
        allocations: state.allocations, selectedAllocation: action.allocation);
  }

  if (action is StoreAllocationPayment) {
    return AllocationState(
        allocations: state.allocations,
        selectedAllocation: state.selectedAllocation,
        allocationPayment: action.payment);
  }

  if (action is StoreActivities) {
    return AllocationState(
        allocations: state.allocations,
        selectedAllocation: state.selectedAllocation,
        allocationPayment: state.allocationPayment,
        activities: action.activities);
  }

  return state;
}
