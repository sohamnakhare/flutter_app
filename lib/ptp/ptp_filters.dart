import 'package:flutter/material.dart';

class PTPFilters extends StatelessWidget {
  final String selectedFilter;
  final Function onFilterSelect;

  PTPFilters(this.selectedFilter, this.onFilterSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: selectedFilter == 'upcoming_ptp'
                      ? Colors.blue[800]
                      : null,
                  textColor:
                      selectedFilter == 'upcoming_ptp' ? Colors.white : null,
                  onPressed: () {
                    onFilterSelect('upcoming_ptp');
                  },
                  child: Text('Upcoming PTPs'),
                ),
                RaisedButton(
                  color:
                      selectedFilter == 'broken_ptp' ? Colors.blue[800] : null,
                  textColor:
                      selectedFilter == 'broken_ptp' ? Colors.white : null,
                  onPressed: () {
                    onFilterSelect('broken_ptp');
                  },
                  child: Text('Broken PTPs'),
                ),
              ],
            )
          ],
        ));
  }
}
