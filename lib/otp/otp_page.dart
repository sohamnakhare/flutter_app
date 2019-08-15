import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'otp_widget.dart';
import '../redux/store/AppState.dart';
import 'package:flutter_app/redux/actions/actions.dart';

class OTPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MCollosys'),
      ),
      body: StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel viewModel) => OTPWidget(
            viewModel.authToken,
            viewModel.mobileNumber,
            viewModel.onVerifyOTPSuccess),
      ),
    );
  }
}

class _ViewModel {
  final String authToken;
  final String mobileNumber;
  final Function(String authToken) onVerifyOTPSuccess;

  _ViewModel({this.authToken, this.mobileNumber, this.onVerifyOTPSuccess});

  factory _ViewModel.create(Store<AppState> store) {
    _onVerifyOTPSuccess(String authToken) {
      store.dispatch(StoreAuthToken(authToken));
    }

    return _ViewModel(
        authToken: store.state.authState.token,
        mobileNumber: store.state.authState.mobileNumber,
        onVerifyOTPSuccess: _onVerifyOTPSuccess);
  }
}
