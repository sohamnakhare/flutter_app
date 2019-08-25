import 'package:meta/meta.dart';
import '../../model/Report.dart';

@immutable
class ReportState {
  final List<String> products;
  final String selectedProduct;
  final Report report;

  ReportState({this.products, this.selectedProduct, this.report});

  ReportState copyWith({List<String> products}) {
    return new ReportState(
        products: products ?? this.products,
        selectedProduct: selectedProduct ?? this.selectedProduct,
        report: report ?? this.report);
  }

  factory ReportState.initial() {
    return ReportState(
        products: <String>[],
        selectedProduct: "",
        report: Report(
            allocatedAmount: 0,
            allocatedCount: 0,
            collectedCount: 0,
            collectedAmount: 0));
  }
}
