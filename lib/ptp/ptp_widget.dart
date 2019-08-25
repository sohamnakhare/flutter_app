import 'package:flutter/material.dart';
import '../model/PTP.dart';
import './ptp_filters.dart';
import '../app_constants.dart' as constants;

class PTPWidget extends StatelessWidget {
  final List<PTP> ptps;
  final String selectedPTPFilter;
  final Function onPTPFilterSelect;

  PTPWidget(this.ptps, this.selectedPTPFilter, this.onPTPFilterSelect);

  @override
  Widget build(BuildContext context) {
    return Column(
            children: <Widget>[
              PTPFilters(selectedPTPFilter, onPTPFilterSelect),
              ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(20.0),
                  children: ptps.map((PTP ptp) => _PTPDetails(ptp)).toList())
            ],
          );
  }
}

class _PTPDetails extends StatelessWidget {
  final PTP ptp;

  _PTPDetails(this.ptp);

  @override
  Widget build(BuildContext context) {
    DateTime ptpDate = DateTime.parse(ptp.ptpDate);
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
                            ptpDate.day.toString() +
                                " " +
                                constants.mmm[ptpDate.month - 1],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(this.ptp.customerName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(this.ptp.accountNo,
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
