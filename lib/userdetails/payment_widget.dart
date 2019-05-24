import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import '../model/User.dart';
import 'package:image_picker/image_picker.dart';
import '../collection/collection_page.dart';

class Payment extends StatefulWidget {
  final User user;

  Payment(this.user);

  @override
  _PaymentState createState() {
    return _PaymentState();
  }
}

class _PaymentState extends State<Payment> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _paymentModes = <String>['', 'Cash', 'Cheque'];
  List<String> _ifscs = <String>['', 'ICICI1234'];
  List<String> _payees = <String>['', 'Self'];
  List<String> _relations = <String>['', 'Father', 'Mother'];
  final _amountController = TextEditingController();
  final _chequeController = TextEditingController();
  final _nameController = TextEditingController();
  String _relation = '';
  String _paymentMode = '';
  String _ifsc = '';
  String _payee = '';
  File _chequeImage;
  File _relationImage;

  Future getChequeImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _chequeImage = image;
    });
  }

  Future getRelationImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _relationImage = image;
    });
  }

  void _handleSubmit(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _showDialog(context);
    }
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    var content = "Payment received successfully \n"
        "Account No. : "+this.widget.user.accountNumber+"\n"
        "Loan No. : "+this.widget.user.loanNumber+"\n"
        "Confirmation message has been sent to the customer";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text( "Payment confirmation"),
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
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter TAD';
                      }
                    },
                    initialValue: this.widget.user.tad,
                    decoration: InputDecoration(labelText: 'TAD'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter MAD';
                      }
                    },
                    initialValue: this.widget.user.mad,
                    decoration: InputDecoration(labelText: 'MAD'),
                  ),
                  TextFormField(
                    controller: _amountController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter payment amount';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Payment amount'),
                  ),
                  new FormField(validator: (value) {
                    if (value == null || value == '') {
                      return 'Please select payment mode';
                    }
                  }, builder: (FormFieldState state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Payment mode',
                            ),
                            isEmpty: _paymentMode == '',
                            child: new DropdownButtonHideUnderline(
                              child: new DropdownButton(
                                value: _paymentMode,
                                isDense: true,
                                onChanged: (String newValue) {
                                  setState(() {
                                    _paymentMode = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _paymentModes.map((String value) {
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
                    controller: _chequeController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter cheque number';
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: Icon(Icons.camera_alt),
                          onPressed: this.getChequeImage,
                        ),
                        labelText: 'Cheque number'),
                  ),
                  new FormField(validator: (value) {
                    if (value == null || value == '') {
                      return 'Please select  IFSC';
                    }
                  }, builder: (FormFieldState state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'IFSC',
                            ),
                            isEmpty: _ifsc == '',
                            child: new DropdownButtonHideUnderline(
                              child: new DropdownButton(
                                value: _ifsc,
                                isDense: true,
                                onChanged: (String newValue) {
                                  setState(() {
                                    _ifsc = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _ifscs.map((String value) {
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
                  new FormField(validator: (value) {
                    if (value == null || value == '') {
                      return 'Please select payee';
                    }
                  }, builder: (FormFieldState state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Payee',
                            ),
                            isEmpty: _payee == '',
                            child: new DropdownButtonHideUnderline(
                              child: new DropdownButton(
                                value: _payee,
                                isDense: true,
                                onChanged: (String newValue) {
                                  setState(() {
                                    _payee = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _payees.map((String value) {
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
                  new FormField(validator: (value) {
                    if (value == null || value == '') {
                      return 'Please select relation';
                    }
                  }, builder: (FormFieldState state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InputDecorator(
                            decoration: InputDecoration(
                              prefixIcon: IconButton(
                                icon: Icon(Icons.camera_alt),
                                onPressed: this.getRelationImage,
                              ),
                              labelText: 'Relation',
                            ),
                            isEmpty: _relation == '',
                            child: new DropdownButtonHideUnderline(
                              child: new DropdownButton(
                                value: _relation,
                                isDense: true,
                                onChanged: (String newValue) {
                                  setState(() {
                                    _relation = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _relations.map((String value) {
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
                    controller: _nameController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter name';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
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
