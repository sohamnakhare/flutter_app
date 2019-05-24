import 'package:flutter/material.dart';
import 'package:flutter_app/splanner/plan/s_planner_plan.dart';
import 'package:flutter_app/splanner/schedule/s_planner_schedule.dart';

class SPlanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'msc',
      home: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kTextTabBarHeight),
            child: new Container(
              color: Colors.blue,
              child: new SafeArea(
                child: Column(
                  children: <Widget>[
                    new Expanded(child: new Container()),
                    new TabBar(
                      tabs: [
                        new Text("Plan",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        new Text("Schedule",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                      indicatorColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: new TabBarView(
            children: <Widget>[
              SPlan(),
              SSchedule(),
            ],
          ),
        ),
      ),
    );
  }
}
