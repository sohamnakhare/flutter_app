import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'collection/collection_page.dart';
import 'splanner/s_planner_page.dart';
import './reports/reports_page.dart';

class AppDrawer extends StatelessWidget {

  void setPreferredOrientationHorizontal() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  void resetPreferredOrientation(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Collection'),
            onTap: () {
              this.resetPreferredOrientation();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CollectionPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('SPlanner'),
            onTap: () {
              this.resetPreferredOrientation();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SPlannerPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.table_chart),
            title: Text('Reports'),
            onTap: () {
              this.setPreferredOrientationHorizontal();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportWidget()),
              );
            },
          ),
        ],
      ),
    );
  }
}
