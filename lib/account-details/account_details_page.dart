import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/store/AppState.dart';
import '../redux/actions/actions.dart';
import '../model/Allocation.dart';
import './account_details_widget.dart';
import '../allocation/allocation_api.dart';
import '../app_constants.dart' as constants;

class AccountDetailsPage extends StatelessWidget {
  final Allocation allocation;

  AccountDetailsPage(this.allocation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Icon(Icons.person),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  child: Text(this.allocation.customerName),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  child: Text(
                    this.allocation.accountNo,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: StoreConnector<AppState, _ViewModel>(
        onInit: (store) {
          AllocationApi allocApi =
              AllocationApi(constants.apiBaseUrl, store.state.authState.token);
          allocApi.getAllocationDetailsById(this.allocation.id).then((res) {
            store.dispatch(StoreSelectedAllocation(res));
          }).catchError((Object error) {
            print("error");
          });
        },
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel viewModel) =>
            viewModel.selectedAllocationDetails == null
                ? Text("")
                : AccountDetails(viewModel.selectedAllocationDetails),
      ),
    );
  }
}

class _ViewModel {
  final String authToken;
  final Allocation selectedAllocationDetails;

  _ViewModel({this.authToken, this.selectedAllocationDetails});

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
      authToken: store.state.authState.token,
      selectedAllocationDetails: store.state.allocState.selectedAllocation,
    );
  }
}
