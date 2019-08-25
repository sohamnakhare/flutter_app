import 'package:meta/meta.dart';
import './AuthState.dart';
import './AllocationState.dart';
import './PTPState.dart';
import './ReportState.dart';

@immutable
class AppState {
  final AuthState authState;
  final AllocationState allocState;
  final PTPState ptpState;
  final ReportState reportState;

  AppState(
      {@required this.authState,
      @required this.allocState,
      @required this.ptpState,
      @required this.reportState});

  factory AppState.initial() {
    return new AppState(
        authState: AuthState.initial(),
        allocState: AllocationState.initial(),
        ptpState: PTPState.initial(),
        reportState: ReportState.initial());
  }

  AppState copyWith({AuthState authState, AllocationState allocState}) {
    return AppState(
        authState: authState ?? this.authState,
        allocState: allocState ?? this.allocState,
        ptpState: ptpState ?? this.ptpState,
        reportState: reportState ?? this.reportState);
  }
}
