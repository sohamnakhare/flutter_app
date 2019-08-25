import 'package:flutter/material.dart';
import '../model/Allocation.dart';
import 'package:flutter_app/add-activity/add_activity_page.dart';
import '../view-activity/view_activity_page.dart';
import 'package:flutter_app/payment/payment_page.dart';

class AccountDetails extends StatelessWidget {
  final Allocation allocation;

  AccountDetails(this.allocation);

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
                    initialValue: this.allocation.product,
                    decoration: InputDecoration(labelText: 'Product'),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    initialValue: this.allocation.outstandingAmount.toString(),
                    decoration: InputDecoration(labelText: 'TAD'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Residence Address'),
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Office Address'),
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Mobile number'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Office number'),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PaymentPage(allocation)),
                                  );
                                },
                                child: Text('Paying'),
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddActivityPage(allocation)),
                                  );
                                },
                                child: Text('Add Activity'),
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ViewActivityPage(allocation)),
                                  );
                                },
                                child: Text('View activity'),
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              ))),
    );
  }
}
