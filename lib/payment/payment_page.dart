import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './payment_widget.dart';
import '../redux/store/AppState.dart';
import '../model/Allocation.dart';
import '../model/Payment.dart';
import '../api/enum_master_api.dart';
import '../app_constants.dart' as constants;


class PaymentPage extends StatelessWidget {
  final Allocation allocation;

  PaymentPage(this.allocation);

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
      )),
      body: StoreConnector<AppState, _ViewModel>(
          onInit: (store) {
            EnumMasterApi enumMasterApi = EnumMasterApi(constants.apiBaseUrl, store.state.authState.token);
            enumMasterApi.getPayeeRelation().then((relations){
              print(relations.toString());
            });
          },
          converter: (Store<AppState> store) => _ViewModel.create(store),
          builder: (BuildContext context, _ViewModel viewModel) {
            return PaymentWidget(allocation, viewModel.authToken);
          }),
    );
  }
}

class _ViewModel {
  final String authToken;
  final Allocation selectedAllocation;
  final Payment allocationPayment;

  _ViewModel({this.authToken, this.selectedAllocation, this.allocationPayment});

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
        authToken: store.state.authState.token,
        selectedAllocation: store.state.allocState.selectedAllocation);
  }
}
