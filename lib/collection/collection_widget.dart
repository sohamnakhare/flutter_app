import 'package:flutter/material.dart';
import '../model/User.dart';
import './collection_filter.dart';
import './collection_user_list.dart';

class Collection extends StatefulWidget {
  @override
  _CollectionState createState() {
    return _CollectionState();
  }
}

class _CollectionState extends State<Collection> {
  List<User> users;

  @override
  void initState() {
    super.initState();
    users = User.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CollectionFilter(),
        Expanded(
          child: CollectionUserList(users),
        )
      ],
    );
  }
}
