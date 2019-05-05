import 'package:flutter/material.dart';
import 'collection/collection_page.dart';
import 'splanner/s_planner_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Collection'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CollectionPage()),
              );
            },
          ),
          ListTile(
            title: Text('SPlanner'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SPlannerPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
