import 'package:flutter/material.dart';
import '../model/Allocation.dart';
import '../model/Activity.dart';

class ViewActivityWidget extends StatelessWidget {
  final Allocation allocation;
  final List<Activity> activities;

  ViewActivityWidget(this.allocation, this.activities);

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Activity activity) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        title: Text(
          activity.activity,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Text(activity.dispositionCode)),
            )
          ],
        ),
        trailing: Icon(Icons.keyboard_arrow_right, size: 30.0),
        onTap: () {});

    Card makeCard(Activity activity) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(),
            child: makeListTile(activity),
          ),
        );

    return activities == null
        ? Text('loading...')
        : Container(
            // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: activities.length,
              itemBuilder: (BuildContext context, int index) {
                return makeCard(activities[index]);
              },
            ),
          );
  }
}
