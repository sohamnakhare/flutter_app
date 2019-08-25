import './AuthState.dart';
import './AppState.dart';
import './PTPState.dart';
import './AllocationState.dart';
import './ReportState.dart';
import 'package:flutter_app/redux/actions/actions.dart';

AppState appReducer(AppState state, dynamic action) => new AppState(
    authState: authReducer(state.authState, action),
    allocState: allocReducer(state.allocState, action),
    ptpState: ptpReducer(state.ptpState, action),
    reportState: reportReducer(state.reportState, action));

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

PTPState ptpReducer(PTPState state, action) {
  if (action is StorePTPs) {
    return PTPState(
        ptps: action.ptps, selectedPTPFilter: state.selectedPTPFilter);
  }

  if (action is StoreSelectedPTPFilter) {
    return PTPState(
        ptps: state.ptps, selectedPTPFilter: action.selectedPTPFilter);
  }
  return state;
}

ReportState reportReducer(ReportState state, action) {
  if (action is StoreProducts) {
    return ReportState(products: action.products);
  }

  if (action is StoreSelectedProduct) {
    return ReportState(
        products: state.products, selectedProduct: action.selectedProduct);
  }

  if (action is StoreReport) {
    return ReportState(
        products: state.products,
        selectedProduct: state.selectedProduct,
        report: action.report);
  }
  return state;
}
