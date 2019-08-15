import 'package:meta/meta.dart';
import './AuthState.dart';
import './AllocationState.dart';

@immutable
class AppState {
  final AuthState authState;
  final AllocationState allocState;

  AppState({@required this.authState, @required this.allocState});

  factory AppState.initial() {
    return new AppState(
      authState: AuthState.initial(),
      allocState: AllocationState.initial()
    );
  }

  AppState copyWith({AuthState authState, AllocationState allocState}) {
    return AppState(
        authState: authState ?? this.authState,
        allocState: allocState ?? this.allocState);
  }
}
