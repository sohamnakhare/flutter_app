import 'package:flutter/material.dart';

class CollectionFilter extends StatelessWidget {
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
                          child: Text('New allocation (7)'),
                        )),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text('PTP (5)'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text('Failure (4)'),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ],
    );
  }
}