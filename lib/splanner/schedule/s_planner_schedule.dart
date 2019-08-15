import 'package:flutter/material.dart';
import '../../model/Account.dart';

class SSchedule extends StatefulWidget {
  @override
  _SScheduleState createState() {
    return _SScheduleState();
  }
}

class _SScheduleState extends State<SSchedule> {
  List<Account> accounts;

  @override
  void initState() {
    super.initState();
    accounts = Account.getAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _TimeFilter(),
        Expanded(
          child: _ScheduleAccountList(this.accounts),
        )
      ],
    );
  }
}

class _TimeFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.yellow[800],
                height: kToolbarHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text("09:00 - 10:00")],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                height: kToolbarHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text("10:00 - 11:00")],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                height: kToolbarHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text("11:00 - 12:00")],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.yellow[800],
                height: kToolbarHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text("12:00 - 13:00")],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class _ScheduleAccountList extends StatelessWidget {
  final List<Account> accounts;
  final ScrollController _controller = new ScrollController();

  _ScheduleAccountList(this.accounts);

  @override
  Widget build(BuildContext context) {
    return accounts == null
        ? _NoDetailsFound()
        : ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _controller,
            padding: const EdgeInsets.all(20.0),
            children: accounts.map((Account account) => _AccountDetails(account)).toList());
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
  bool _checked;

  void handleCheckboxChange(bool isChecked) {
    setState(() {
      _checked = isChecked;
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
                  Text(this.widget.account.accountNumber, textAlign: TextAlign.left),
                  Text(this.widget.account.location, textAlign: TextAlign.left)
                ],
              ),
            )),
            Container(
              child: new Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[Text("09:00 - 10:00")],
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.refresh),
                          )
                        ],
                      )
                    ],
                  )
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
