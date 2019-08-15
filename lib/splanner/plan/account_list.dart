import 'package:flutter/material.dart';
import '../../model/Account.dart';

class AccountList extends StatelessWidget {
  final List<Account> accounts;
  final ScrollController _controller = new ScrollController();

  AccountList(this.accounts);

  @override
  Widget build(BuildContext context) {
    return this.accounts == null
        ? _NoDetailsFound()
        : ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _controller,
            padding: const EdgeInsets.all(20.0),
            children:
                this.accounts.map((Account account) => _AccountDetails(account)).toList());
  }
}

class _NoDetailsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("No data found");
  }
}

class _AccountDetails extends StatefulWidget {
  final Account account;

  _AccountDetails(this.account);

  @override
  _AccountDetailsState createState() {
    return _AccountDetailsState();
  }
}

class _AccountDetailsState extends State<_AccountDetails> {
  String _timeSlot;
  bool _checked;

  void handleCheckboxChange(bool isChecked) {
    setState(() {
      _checked = isChecked;
    });
  }

  void handleTimeSlotSelect(String value) {
    setState(() {
      _timeSlot = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Checkbox(
                value: _checked == true,
                onChanged: this.handleCheckboxChange,
              ),
            ),
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.widget.account.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(this.widget.account.accountNumber,
                      textAlign: TextAlign.left),
                  Text(this.widget.account.location, textAlign: TextAlign.left)
                ],
              ),
            )),
            Container(
              child: new Column(
                children: <Widget>[
                  new DropdownButton<String>(
                    hint: Text('Plan'),
                    value: _timeSlot,
                    items: <String>[
                      '09:00 - 10:00',
                      '10:00 - 11:00',
                      '11:00 - 12:00',
                      '12:00 - 13:00'
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: this.handleTimeSlotSelect,
                  ),
                ],
              ),
            )
          ],
        ),
        Divider(),
      ],
    ));
  }
}
