import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import '../form-fields/mcol_dropdown_form_field.dart';
import '../model/Allocation.dart';
import 'package:image_picker/image_picker.dart';
import '../allocation/allocation_page.dart';
import './PaymentPayload.dart';
import './payment_api.dart';
import '../app_constants.dart' as constants;

class PaymentWidget extends StatefulWidget {
  final Allocation allocation;
  final String authToken;

  PaymentWidget(this.allocation, this.authToken);

  @override
  _PaymentState createState() {
    return _PaymentState();
  }
}

class _PaymentState extends State<PaymentWidget> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _paymentModes = <String>['', 'Cash', 'Cheque', 'DD'];
  List<String> _banks = <String>['', 'ICICI', 'SBI', 'AXIS', 'HDFC'];
  List<String> _payees = <String>['', 'Self', 'ThirdParty'];
  List<String> _relations = <String>[
    '',
    'Brother',
    'Father',
    'Husband',
    'Mother',
    'Sister',
    'Wife'
  ];

  final _amountController = TextEditingController();
  final _imageController = TextEditingController();
  final _nameController = TextEditingController();
  String _paymentMode = '';
  String _bank = '';
  String _payee = '';
  String _relation = '';
  File _paymentImage;

  Future getPaymentImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _paymentImage = image;
    });
  }

  void _handleSubmit(BuildContext context) {
    if (_formKey.currentState.validate()) {
      PaymentApi paymentApi =
          PaymentApi(constants.apiBaseUrl, this.widget.authToken);
      Allocation alloc = this.widget.allocation;
      PaymentPayload payload = PaymentPayload(
          allocDetailId: alloc.id,
          amount: double.parse(_amountController.text),
          accountNumber: alloc.accountNo,
          paymentMode: _paymentMode,
          payeeType: _payee,
          payeeRelation:
              _relation == '' ? '' : _relations.indexOf(_relation).toString(),
          payeeName: _nameController.text,
          product: alloc.product,
          dataSource: alloc.dataSource);
      paymentApi.savePayment(payload.toMap()).then((res) {
        _showDialog(context);
      }).catchError((Object error) {
        print(error.toString());
      });
    }
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    var content = "Payment received successfully \n"
            "Account No. : " +
        this.widget.allocation.accountNo +
        "\n"
            "Policy : " +
        this.widget.allocation.policyName +
        "\n"
            "Confirmation message has been sent to the customer";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Payment confirmation"),
          content: new Text(content),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllocationPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  _handlePaymentModeChange(newValue, state) {
    setState(() {
      _paymentMode = newValue;
      state.didChange(newValue);
    });
  }

  _handlePayeeChange(newValue, state) {
    setState(() {
      _payee = newValue;
      state.didChange(newValue);
    });
  }

  _handlePayeeRelationChange(newValue, state) {
    setState(() {
      _relation = newValue;
      state.didChange(newValue);
    });
  }

  _handleBankChange(newValue, state) {
    setState(() {
      _bank = newValue;
      state.didChange(newValue);
    });
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
                        return 'Please enter the receipt  number';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Receipt number'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter TAD';
                      }
                    },
                    initialValue:
                        this.widget.allocation.outstandingAmount.toString(),
                    decoration: InputDecoration(labelText: 'TAD'),
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
                  MColDropdownFormField("Payment mode",
                      _handlePaymentModeChange, _paymentMode, _paymentModes),
                  if (_paymentMode == 'Cheque')
                    MColDropdownFormField(
                        "Bank", _handleBankChange, _bank, _banks),
                  MColDropdownFormField(
                      "Payee", _handlePayeeChange, _payee, _payees),
                  MColDropdownFormField("Relation", _handlePayeeRelationChange,
                      _relation, _relations),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter name';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextFormField(
                    controller: _imageController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter name for the image';
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: Icon(Icons.camera_alt),
                          onPressed: this.getPaymentImage,
                        ),
                        labelText: 'Image title'),
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
