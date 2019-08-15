import 'package:flutter/material.dart';
import '../app_drawer.dart';
import 'package:bidirectional_scroll_view/bidirectional_scroll_view.dart';
import '../model/Report.dart';

class ReportWidget extends StatefulWidget {
  @override
  ReportWidgetState createState() => ReportWidgetState();
}

class ReportWidgetState extends State<ReportWidget> {
  List<Report> reports;
  bool sort;

  @override
  void initState() {
    super.initState();
    reports = Report.getReport();

  }

  dataBody() {
    return BidirectionalScrollViewPlugin(
      child: DataTable(
        columns: [
          DataColumn(
            label: Text("Parameter"),
          ),
          DataColumn(
            label: Text("Case count"),
          ),
          DataColumn(
            label: Text("Amount"),
          ),
          DataColumn(
            label: Text("Actual %"),
          ),
          DataColumn(
            label: Text("Target %"),
          ),
        ],
        rows: reports
            .map(
              (report) => DataRow(cells: [
                    DataCell(
                      Text(report.parameter),
                    ),
                    DataCell(
                      Text(report.caseCount.toString()),
                    ),
                    DataCell(
                      Text(report.amount.toString()),
                    ),
                    DataCell(
                      Text(report.actual.toString()),
                    ),
                    DataCell(
                      Text(report.target.toString()),
                    ),
                  ]),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Icon(Icons.person),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  child: Text("Employee Details"),
                ),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(8.0, 16, 8, 8),
            child: Table(
              children: [
                TableRow(children: [
                  Row(
                    children: <Widget>[
                      Text(
                        "Name: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Piyush Bhandari"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Bucket: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("10"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Period: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("May-19"),
                    ],
                  )
                ]),
                TableRow(children: [
                  Row(
                    children: <Widget>[
                      Text(
                        "Product: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Car loan"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Total due: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("150000.00"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Terrain: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Pune"),
                    ],
                  )
                ]),
              ],
            ),
          ),
          Expanded(
            child: dataBody(),
          ),
        ],
      ),
    );
  }
}
