import 'package:flutter/material.dart';
import '../../model/User.dart';

class UserList extends StatelessWidget {
  final List<User> users;
  final ScrollController _controller = new ScrollController();

  UserList(this.users);

  @override
  Widget build(BuildContext context) {
    return this.users == null
        ? _NoDetailsFound()
        : ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _controller,
            padding: const EdgeInsets.all(20.0),
            children:
                this.users.map((User user) => _UserDetails(user)).toList());
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
                  Text(this.widget.user.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(this.widget.user.accountNumber,
                      textAlign: TextAlign.left),
                  Text(this.widget.user.location, textAlign: TextAlign.left)
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
