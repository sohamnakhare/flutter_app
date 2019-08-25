import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../model/Report.dart';
import '../redux/store/AppState.dart';
import './reports_widget.dart';
import '../redux/actions/actions.dart';
import '../app_drawer.dart';
import '../api/enum_master_api.dart';
import './reports_api.dart';
import '../app_constants.dart' as constants;

class ReportWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        onInit: (store) {
          EnumMasterApi enumMasterApi =
              EnumMasterApi(constants.apiBaseUrl, store.state.authState.token);
          enumMasterApi.getProducts().then((res) {
            store.dispatch(StoreProducts(res));
          }).catchError((Object error) {
            print(error.toString());
          });
        },
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel viewModel) {
          return Scaffold(
              drawer: AppDrawer(),
              appBar: AppBar(
                title: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                          child: Text("Report"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              body: ReportsWidget(viewModel.products, viewModel.onProductSelect,
                  viewModel.selectedProduct, viewModel.report));
        });
  }
}

class _ViewModel {
  final String authToken;
  final List<String> products;
  final String selectedProduct;
  final Report report;
  final Function(String selectedProduct) onProductSelect;

  _ViewModel(
      {this.authToken,
      this.products,
      this.onProductSelect,
      this.selectedProduct,
      this.report});

  factory _ViewModel.create(Store<AppState> store) {
    _onProductSelect(String selectedProduct) {
      store.dispatch(StoreSelectedProduct(selectedProduct));
      ReportApi reportApi =
          ReportApi(constants.apiBaseUrl, store.state.authState.token);
      reportApi.getReportForProduct(selectedProduct).then((report) {
        store.dispatch(StoreReport(report));
      }).catchError((Object error) {
        print(error.toString());
      });
    }

    return _ViewModel(
        authToken: store.state.authState.token,
        products: store.state.reportState.products,
        selectedProduct: store.state.reportState.selectedProduct,
        onProductSelect: _onProductSelect,
        report: store.state.reportState.report);
  }
}
