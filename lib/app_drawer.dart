import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'allocation/allocation_page.dart';
import './ptp/ptp_page.dart';
import './reports/reports_page.dart';
import './profile/profile_page.dart';

class AppDrawer extends StatelessWidget {
  void _handleDrawerHeaderPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Amit Rawat"),
            accountEmail: Text("amitrawat@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            onDetailsPressed: () {
              _handleDrawerHeaderPress(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Allocation'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllocationPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('PTP'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PTPPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.table_chart),
            title: Text('Reports'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportWidget()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.popUntil(
                  context, ModalRoute.withName(Navigator.defaultRouteName));
            },
          ),
        ],
      ),
    );
  }
}
