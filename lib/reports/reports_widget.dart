import 'package:flutter/material.dart';
import 'package:bidirectional_scroll_view/bidirectional_scroll_view.dart';
import '../model/Report.dart';
import '../form-fields/mcol_dropdown_form_field.dart';

class ReportsWidget extends StatelessWidget {
  final List<String> products;
  final Function(String selectedProduct) onProductSelect;
  final String selectedProduct;
  final Report report;

  ReportsWidget(
      this.products, this.onProductSelect, this.selectedProduct, this.report);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MColDropdownFormField("Select Product",
              (value, FormFieldState state) {
            onProductSelect(value.toString());
          }, selectedProduct, this.products),
          report == null
              ? Text("")
              : Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Row(children: <Widget>[
                        Expanded(
                          child: Text(
                            "Allocation amount",
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            report.allocatedAmount.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Row(children: <Widget>[
                        Expanded(
                          child: Text(
                            "Allocation count",
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            report.allocatedCount.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Row(children: <Widget>[
                        Expanded(
                          child: Text(
                            "Collection amount",
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            report.collectedAmount.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Row(children: <Widget>[
                        Expanded(
                          child: Text(
                            "Collection count",
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            report.collectedCount.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                    )
                  ],
                )
        ],
      ),
    );
  }
}
