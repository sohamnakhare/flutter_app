import 'package:flutter/material.dart';
import '../model/Allocation.dart';
import '../account-details/account_details_page.dart';

class AllocationAccountList extends StatelessWidget {
  final List<Allocation> allocations;

  AllocationAccountList(this.allocations);

  @override
  Widget build(BuildContext context) {
    return (allocations == null || allocations.length == 0)
        ? _NoDetailsFound()
        : ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(20.0),
            children: allocations
                .map((Allocation allocation) => _AccountDetails(allocation))
                .toList());
  }
}

class _NoDetailsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("No data found");
  }
}

class _AccountDetails extends StatefulWidget {
  final Allocation allocation;

  _AccountDetails(this.allocation);

  @override
  _AccountDetailsState createState() {
    return _AccountDetailsState();
  }
}

class _AccountDetailsState extends State<_AccountDetails> {
  bool _checked;

  handleCheckboxChange(bool isChecked) {
    setState(() {
      _checked = isChecked;
    });
  }

  _handleAccountTap(BuildContext context, Allocation allocation) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountDetailsPage(allocation)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Checkbox(
                value: _checked == true,
                onChanged: this.handleCheckboxChange,
              ),
            ),
            Expanded(
                child: InkWell(
                    onTap: () =>
                        this._handleAccountTap(context, this.widget.allocation),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(this.widget.allocation.customerName,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.widget.allocation.accountNo,
                              textAlign: TextAlign.left),
                        ],
                      ),
                    ))),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(this.widget.allocation.outstandingAmount.toString())
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Divider(),
      ],
    ));
  }
}
