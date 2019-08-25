import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './ptp_widget.dart';
import '../app_drawer.dart';
import '../model/PTP.dart';
import '../redux/store/AppState.dart';
import './ptp_api.dart';
import '../redux/actions/actions.dart';
import '../app_constants.dart' as constants;

class PTPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        onInit: (store) {
          PTPApi ptpApi =
              PTPApi(constants.apiBaseUrl, store.state.authState.token);
          ptpApi.getPTPs().then((ptps) {
            store.dispatch(StorePTPs(ptps));
            store.dispatch(StoreSelectedPTPFilter('upcoming_ptp'));
          }).catchError((Object error) {
            print(error.toString());
          });
        },
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel viewModel) {
          return Scaffold(
              appBar: AppBar(
                title: Row(children: <Widget>[
                  Icon(Icons.schedule),
                  Expanded(
                    child: Text('  PTP'),
                  ),
                ]),
              ),
              drawer: AppDrawer(),
              body: PTPWidget(viewModel.ptps, viewModel.selectedPTPFilter,
                  viewModel.onPTPFilterSelect),
              bottomNavigationBar: BottomAppBar(
                child: Container(
                  height: 50.0,
                ),
              ));
        });
  }
}

class _ViewModel {
  final String authToken;
  final List<PTP> ptps;
  final Function(String selectedPTPFilter) onPTPFilterSelect;
  final String selectedPTPFilter;

  _ViewModel(
      {this.authToken,
      this.ptps,
      this.onPTPFilterSelect,
      this.selectedPTPFilter});

  factory _ViewModel.create(Store<AppState> store) {
    List<PTP> _filterPTPs(List<PTP> ptps) {
      switch (store.state.ptpState.selectedPTPFilter) {
        case '':
          return ptps;
        case 'upcoming_ptp':
          return ptps.where((ptp) {
            DateTime ptpDate = DateTime.parse(ptp.ptpDate + " 00:00:00");
            DateTime today = DateTime.now();
            return ptpDate.difference(today).inDays >= 0;
          }).toList();
        case 'broken_ptp':
          return ptps.where((ptp) {
            DateTime ptpDate = DateTime.parse(ptp.ptpDate + " 00:00:00");
            DateTime today = DateTime.now();
            return ptpDate.difference(today).inDays < 0;
          }).toList();
        default:
          return ptps;
      }
    }

    _onPTPFilterSelect(String selectedPTPFilter) {
      store.dispatch(StoreSelectedPTPFilter(selectedPTPFilter));
    }

    return _ViewModel(
        authToken: store.state.authState.token,
        ptps: _filterPTPs(store.state.ptpState.ptps),
        selectedPTPFilter: store.state.ptpState.selectedPTPFilter,
        onPTPFilterSelect: _onPTPFilterSelect);
  }
}
