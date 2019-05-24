import 'package:flutter/material.dart';
import 'package:flutter_app/splanner/s_planner.dart';
import '../app_drawer.dart';

class SPlannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Icon(Icons.calendar_today),
              Text('  SPlanner')
            ],
          ),
        ),
        drawer: AppDrawer(),
        body: SPlanner(),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
          ),
        ));
  }
}
