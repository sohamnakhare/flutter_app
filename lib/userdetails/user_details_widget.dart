import 'package:flutter/material.dart';
import '../model/User.dart';
import './non_payment_page.dart';
import './payment_page.dart';

class UserDetails extends StatelessWidget {
  final User user;

  UserDetails(this.user);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    initialValue: this.user.allocatedBy,
                    decoration: InputDecoration(labelText: 'Allocated by'),
                  ),
                  TextFormField(
                    initialValue: this.user.product,
                    decoration: InputDecoration(labelText: 'Product'),
                  ),
                  TextFormField(
                    initialValue: this.user.residenceAddress,
                    decoration: InputDecoration(labelText: 'Residence Address'),
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                  ),
                  TextFormField(
                    initialValue: this.user.officeAddress,
                    decoration: InputDecoration(labelText: 'Office Address'),
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                  ),
                  TextFormField(
                    initialValue: this.user.mobileNumber,
                    decoration: InputDecoration(labelText: 'Mobile number'),
                  ),
                  TextFormField(
                    initialValue: this.user.tad,
                    decoration: InputDecoration(labelText: 'TAD'),
                  ),
                  TextFormField(
                    initialValue: this.user.officePhoneNumber,
                    decoration: InputDecoration(labelText: 'Office number'),
                  ),
                  TextFormField(
                    initialValue: this.user.email,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(8),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PaymentPage(user)),
                              );
                            },
                            child: Text('Paying'),
                          )),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NonPaymentPage(user)),
                            );
                          },
                          child: Text('Not paying'),
                        ),
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
