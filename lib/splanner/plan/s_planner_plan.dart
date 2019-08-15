import 'package:flutter/material.dart';
import './plan_filter.dart';
import './account_list.dart';
import '../../model/Account.dart';

class SPlan extends StatefulWidget {
  @override
  _SPlanState createState() {
    return _SPlanState();
  }
}

class _SPlanState extends State<SPlan> {
  List<Account> users;

  @override
  void initState() {
    super.initState();
    this.users = Account.getAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PlanFilter(),
        Expanded(
          child: AccountList(this.users),
        )
      ],
    );
  }
}