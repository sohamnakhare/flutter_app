import 'package:flutter/material.dart';

class PlanFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.yellow[800],
                height: kToolbarHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text("09:00 - 10:00")],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                height: kToolbarHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text("10:00 - 11:00")],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                height: kToolbarHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text("11:00 - 11:00")],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.yellow[800],
                height: kToolbarHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text("12:00 - 13:00")],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}