import 'package:flutter/material.dart';
import './ptp_widget.dart';
import '../app_drawer.dart';

class PTPPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PTPPageState();
  }
}

class _PTPPageState extends State<PTPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: <Widget>[
            Icon(Icons.schedule),
            Expanded(
              child: Text('  PTP'),
            ),
          ]),
        ),
        drawer: AppDrawer(),
        body: PTPList(),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
          ),
        ));
  }
}
