import 'package:flutter/material.dart';
import '../model/SPlannerUserVM.dart';

class SPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.yellow[800],
                height: kToolbarHeight,
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[Text("one")],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                height: kToolbarHeight,
                child: Column(
                  children: <Widget>[Text("two")],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                height: kToolbarHeight,
                child: Column(
                  children: <Widget>[Text("three")],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.yellow[800],
                height: kToolbarHeight,
                child: Column(
                  children: <Widget>[Text("four")],
                ),
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[_SPlanUserList()],
        )
      ],
    );
  }
}

class _SPlanUserList extends StatefulWidget {
  @override
  _SPlanUserListState createState() {
    return _SPlanUserListState();
  }
}

class _SPlanUserListState extends State<_SPlanUserList> {
  List<SPlannerVM> userData;

  @override
  void initState() {
    super.initState();
    userData = [
      SPlannerVM("Piyush", "PUN00000013980802", "Viman Nagar"),
      SPlannerVM("Piyush", "PUN00000013980802", "Viman Nagar"),
      SPlannerVM("Piyush", "PUN00000013980802", "Viman Nagar"),
      SPlannerVM("Piyush", "PUN00000013980802", "Viman Nagar"),
      SPlannerVM("Piyush", "PUN00000013980802", "Viman Nagar"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return userData == null
        ? _NoDetailsFound()
        : ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children:
                userData.map((SPlannerVM user) => _UserDetails(user)).toList());
  }
}

class _NoDetailsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("No data found");
  }
}

class _UserDetails extends StatelessWidget {
  SPlannerVM user;

  _UserDetails(SPlannerVM user){
    this.user = user;
  }

  void handleCheckboxChange(bool isChecked) {}

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Checkbox(
                value: false,
                onChanged: this.handleCheckboxChange,
              ),
            ),
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.user.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(this.user.accountNumber, textAlign: TextAlign.left),
                  Text(this.user.location, textAlign: TextAlign.left)
                ],
              ),
            )),
            Container(
              child: new Column(
                children: <Widget>[
                  new DropdownButton<String>(
                    items: <String>['Foo', 'Bar'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
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
