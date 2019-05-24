import 'package:flutter/material.dart';
import './plan_filter.dart';
import './user_list.dart';
import '../../model/User.dart';

class SPlan extends StatefulWidget {
  @override
  _SPlanState createState() {
    return _SPlanState();
  }
}

class _SPlanState extends State<SPlan> {
  List<User> users;

  @override
  void initState() {
    super.initState();
    this.users = User.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PlanFilter(),
        Expanded(
          child: UserList(this.users),
        )
      ],
    );
  }
}