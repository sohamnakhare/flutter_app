import 'package:flutter/material.dart';
import '../model/PTP.dart';

class PTPList extends StatelessWidget {
  final List<PTP> ptps = PTP.getPTPs();

  @override
  Widget build(BuildContext context) {
    return ptps == null
        ? _NoDetailsFound()
        : ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(20.0),
            children: ptps.map((PTP ptp) => _PTPDetails(ptp)).toList());
  }
}

class _NoDetailsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("No data found");
  }
}

class _PTPDetails extends StatefulWidget {
  final PTP ptp;

  _PTPDetails(this.ptp);

  @override
  _PTPDetailsState createState() {
    return _PTPDetailsState();
  }
}

class _PTPDetailsState extends State<_PTPDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            this.widget.ptp.timeSlot[0],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            this.widget.ptp.timeSlot[1],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(this.widget.ptp.accountName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(this.widget.ptp.accountNumber,
                                      textAlign: TextAlign.left),
                                ],
                              )
                            ],
                          ))),
                ],
              ),
            )),
          ],
        ),
        Divider(),
      ],
    ));
  }
}
