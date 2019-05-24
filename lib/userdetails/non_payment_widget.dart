import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../model/User.dart';
import '../collection/collection_page.dart';

class NonPayment extends StatefulWidget {
  final User user;

  NonPayment(this.user);

  @override
  _NonPaymentState createState() {
    return _NonPaymentState();
  }
}

class _NonPaymentState extends State<NonPayment> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _reasons = <String>['', 'PTP', 'Not paying'];
  String _reason = '';
  final _remarksController = TextEditingController();
  final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };

  InputType inputType = InputType.both;
  bool editable = true;
  DateTime date;

  void _handleSubmit(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _showDialog(context);
    }
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    var content = _reason == 'PTP'
        ? 'PTP date of ' +
            date.day.toString() +
            '/' +
            date.month.toString() +
            '/' +
            date.year.toString() +
            ' received for loan number 12233322'
        : 'Customer not ready to pay';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(_reason + " confirmation"),
          content: new Text(content),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CollectionPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new FormField(validator: (value) {
                    if (value == null || value == '') {
                      return 'Please select non payment reason';
                    }
                  }, builder: (FormFieldState state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Reason',
                            ),
                            isEmpty: _reason == '',
                            child: new DropdownButtonHideUnderline(
                              child: new DropdownButton(
                                value: _reason,
                                isDense: true,
                                onChanged: (String newValue) {
                                  setState(() {
                                    _reason = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _reasons.map((String value) {
                                  return new DropdownMenuItem(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                              ),
                            )),
                        SizedBox(height: 5.0),
                        Text(
                          state.hasError ? state.errorText : '',
                          style: TextStyle(
                              color: Colors.redAccent.shade700, fontSize: 12.0),
                        )
                      ],
                    );
                  }),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter remarks';
                      }
                    },
                    controller: _remarksController,
                    decoration: InputDecoration(labelText: 'Remarks'),
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                  ),
                  (_reason == 'PTP')
                      ? DateTimePickerFormField(
                          inputType: inputType,
                          format: formats[inputType],
                          editable: editable,
                          decoration: InputDecoration(
                              labelText: 'Date/Time',
                              hasFloatingPlaceholder: false),
                          onChanged: (dt) => setState(() => date = dt),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select PTP date';
                            }
                          })
                      : Container(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(8),
                          child: RaisedButton(
                            onPressed: () => this._handleSubmit(context),
                            child: Text('Submit'),
                          )),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
