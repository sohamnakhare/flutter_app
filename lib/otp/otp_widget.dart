import 'package:flutter/material.dart';
import '../allocation/allocation_page.dart';
import '../app_constants.dart' as constants;
import './otp_api.dart';
import 'package:pin_view/pin_view.dart';

class OTPWidget extends StatelessWidget {
  final String authToken;
  final String mobileNumber;
  final Function(String authToken) onVerifyOTPSuccess;
  final loginApi = new LoginApi(constants.apiBaseUrl);

  OTPWidget(this.authToken, this.mobileNumber, this.onVerifyOTPSuccess);

  @override
  Widget build(BuildContext context) {
    void verifyOTP(String otp) {
      loginApi.verifyOTP(this.mobileNumber, otp).then((value) {
        onVerifyOTPSuccess(value.body);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AllocationPage()),
        );
      }).catchError((Object error) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid otp')));
      });
    }

    void resendOTP() {
      loginApi.getOTP(this.mobileNumber);
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('OTP is sent on your mobile number')));
    }

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
          ),
          Center(
            child: Text(
              "Enter OTP",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Center(
              child: PinView(
                  count: 6,
                  // describes the field number
                  autoFocusFirstField: true,
                  // defaults to true
                  margin: EdgeInsets.all(2.5),
                  // margin between the fields
                  obscureText: true,
                  // describes whether the text fields should be obscure or not, defaults to false
                  style: TextStyle(
                      // style for the fields
                      fontSize: 19.0,
                      fontWeight: FontWeight.w500),
                  dashStyle: TextStyle(
                      // dash style
                      fontSize: 25.0,
                      color: Colors.grey),
                  submit: verifyOTP)),
          Container(
            margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
            alignment: Alignment(1.0, 1.0),
            child: InkWell(
              child: Text(
                "Resend OTP",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: resendOTP,
            ),
          ),
        ],
      ),
    );
  }
}
