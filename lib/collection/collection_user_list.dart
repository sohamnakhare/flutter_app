import 'package:flutter/material.dart';
import '../model/User.dart';
import '../userdetails/user_details_page.dart';

class CollectionUserList extends StatelessWidget {
  final List<User> users;

  CollectionUserList(this.users);

  @override
  Widget build(BuildContext context) {
    return users == null
        ? _NoDetailsFound()
        : ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(20.0),
            children: users.map((User user) => _UserDetails(user)).toList());
  }
}

class _NoDetailsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("No data found");
  }
}

class _UserDetails extends StatefulWidget {
  final User user;

  _UserDetails(this.user);

  @override
  _UserDetailsState createState() {
    return _UserDetailsState();
  }
}

class _UserDetailsState extends State<_UserDetails> {
  bool _checked;
  bool _starred;

  handleCheckboxChange(bool isChecked) {
    setState(() {
      _checked = isChecked;
    });
  }

  _handleUserTap(BuildContext context, User user) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserDetailsPage(user)),
    );
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
                child: InkWell(
                    onTap: () => this._handleUserTap(context, this.widget.user),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(this.widget.user.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.widget.user.accountNumber,
                              textAlign: TextAlign.left),
                          Text(this.widget.user.location,
                              textAlign: TextAlign.left)
                        ],
                      ),
                    ))),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[Text("2200.00")],
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.star_border),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[Text("03/10/2014")],
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
