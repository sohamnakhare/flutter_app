import 'package:flutter/material.dart';
import '../model/User.dart';
import './non_payment_widget.dart';

class NonPaymentPage extends StatelessWidget {
  final User user;

  NonPaymentPage(this.user);

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
                  child: Text(this.user.name),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  child: Text(
                    this.user.accountNumber,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: NonPayment(user),
    );
  }
}
