import 'package:meta/meta.dart';
import '../../model/PTP.dart';

@immutable
class PTPState {
  final List<PTP> ptps;
  final String selectedPTPFilter;

  PTPState({this.ptps, this.selectedPTPFilter});

  PTPState copyWith({List<PTP> ptps, String selectedPTPFilter}) {
    return new PTPState(
        ptps: ptps ?? this.ptps,
        selectedPTPFilter: selectedPTPFilter ?? this.selectedPTPFilter);
  }

  factory PTPState.initial() {
    return PTPState(ptps: <PTP>[], selectedPTPFilter: '');
  }
}
