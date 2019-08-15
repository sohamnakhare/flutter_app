import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'mobile_number_widget.dart';
import '../redux/store/AppState.dart';
import 'package:flutter_app/redux/actions/actions.dart';

class MobileNumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MCollosys'),
      ),
      body: StoreConnector<AppState, _ViewModel>(
          converter: (Store<AppState> store) => _ViewModel.create(store),
          builder: (BuildContext context, _ViewModel viewModel) =>
              MobileNumberWidget(
                onMobileSubmitSuccess: viewModel.onMobileNumberSubmitSuccess,
              )),
    );
  }
}

class _ViewModel {
  final Function(String authToken) onMobileNumberSubmitSuccess;

  _ViewModel({this.onMobileNumberSubmitSuccess});

  factory _ViewModel.create(Store<AppState> store) {
    _onMobileNumberSubmitSuccess(String mobileNumber) {
      store.dispatch(StoreMobileNumber(mobileNumber));
    }

    return _ViewModel(
        onMobileNumberSubmitSuccess: _onMobileNumberSubmitSuccess);
  }
}
