import 'package:flutter/material.dart';
import '../model/SPlannerUserVM.dart';

class Collection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('New allocation'),
                    )),
                Container(
                  margin: EdgeInsets.all(8),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('PTP'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('Failure'),
                  ),
                )
              ],
            ))
          ],
        ),
        Column(
          children: <Widget>[_CollectionUser()],
        )
      ],
    );
  }
}

class _CollectionUser extends StatefulWidget {
  @override
  _CollectionUserState createState() {
    return _CollectionUserState();
  }
}

class _CollectionUserState extends State<_CollectionUser> {
  List<SPlannerVM> userData;

  @override
  void initState() {
    super.initState();
    userData = [
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
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(20.0),
                    children: userData
                        .map((SPlannerVM user) => _UserDetails(user))
                        .toList());

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

  _UserDetails(SPlannerVM user) {
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
                  Text(this.user.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(this.user.accountNumber, textAlign: TextAlign.left),
                  Text(this.user.location, textAlign: TextAlign.left)
                ],
              ),
            )),
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
