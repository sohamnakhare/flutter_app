import 'package:flutter/material.dart';
import 'collection_widget.dart';
import '../app_drawer.dart';

class CollectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Collection'),
        ),
        drawer: AppDrawer(),
        body: Collection(),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
          ),
        ));
  }
}
