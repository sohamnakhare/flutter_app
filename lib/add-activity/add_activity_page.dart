import 'package:flutter/material.dart';
import '../model/Allocation.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/store/AppState.dart';
import 'package:flutter_app/add-activity/add_activity_widget.dart';

class AddActivityPage extends StatelessWidget {
  final Allocation allocation;

  AddActivityPage(this.allocation);

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
          converter: (Store<AppState> store) => _ViewModel.create(store),
          builder: (BuildContext context, _ViewModel viewModel) {
            return AddActivity(allocation, viewModel.authToken);
          }),
    );
  }
}

class _ViewModel {
  final String authToken;
  final Allocation selectedAllocation;

  _ViewModel({this.authToken, this.selectedAllocation});

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
        authToken: store.state.authState.token,
        selectedAllocation: store.state.allocState.selectedAllocation);
  }
}
