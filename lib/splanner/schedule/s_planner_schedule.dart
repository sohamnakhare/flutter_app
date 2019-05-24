import 'package:flutter/material.dart';
import '../../model/User.dart';

class SSchedule extends StatefulWidget {
  @override
  _SScheduleState createState() {
    return _SScheduleState();
  }
}

class _SScheduleState extends State<SSchedule> {
  List<User> users;

  @override
  void initState() {
    super.initState();
    users = User.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _TimeFilter(),
        Expanded(
          child: _ScheduleUserList(this.users),
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

class _ScheduleUserList extends StatelessWidget {
  final List<User> users;
  final ScrollController _controller = new ScrollController();

  _ScheduleUserList(this.users);

  @override
  Widget build(BuildContext context) {
    return users == null
        ? _NoDetailsFound()
        : ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _controller,
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
                  Text(this.widget.user.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(this.widget.user.accountNumber, textAlign: TextAlign.left),
                  Text(this.widget.user.location, textAlign: TextAlign.left)
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
