import 'package:flutter/material.dart';
import '../otp/otp_page.dart';
import './mobile_number_api.dart';
import '../app_constants.dart' as constants;

class MobileNumberWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _mobileNumberController = TextEditingController();
  final mobileNumberApi = new MobileNumberApi(constants.apiBaseUrl);
  final Function(String mobileNumber) onMobileSubmitSuccess;

  MobileNumberWidget({this.onMobileSubmitSuccess});

  handleMobileNumberSubmit(BuildContext context) {
    if (!_formKey.currentState.validate()) {
      return;
    }

    mobileNumberApi.sendOTP(_mobileNumberController.text);
    onMobileSubmitSuccess(_mobileNumberController.text);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OTPPage()),
    );
  }

  String validateMobileNumber(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: _mobileNumberController,
                decoration: InputDecoration(
                  icon: Icon(Icons.phone_iphone),
                  hintText: "Enter mobile number",
                ),
                validator: this.validateMobileNumber,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(8),
                          child: RaisedButton(
                            onPressed: () {
                              this.handleMobileNumberSubmit(context);
                            },
                            child: Text('Next'),
                          )),
                    ],
                  )),
            ],
          ),
        ));
  }
}
