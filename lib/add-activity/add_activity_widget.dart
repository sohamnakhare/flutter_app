import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import '../form-fields/mcol_dropdown_form_field.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../model/Allocation.dart';
import './ActivityPayload.dart';
import '../allocation/allocation_page.dart';
import './add_activity_api.dart';
import '../app_constants.dart' as constants;

class AddActivity extends StatefulWidget {
  final Allocation allocation;
  final String authToken;

  AddActivity(this.allocation, this.authToken);

  @override
  _AddActivityState createState() {
    return _AddActivityState();
  }
}

class _AddActivityState extends State<AddActivity> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _dispositionCodes = <String>[
    '',
    "CB (Call Back)",
    "CPD (Claims Paid)",
    "DIS (Dispute)",
    "Legal",
    "LM (Left Message)",
    "NC (No Contact)",
    "OS (Out Station)",
    "PTP (Promise to pay)",
    "RNR (Ringing no Response)",
    "RTP (Refuse to Pay)",
    "Skip",
    "SS (Successfully Settled)"
  ];
  String _dispositionCode = '';
  List<String> _activities = <String>[
    '',
    'MoveToField',
    'MoveToCalling',
    'CapturePTP',
    'MoveToSupervisor',
    'MarkAsSkip',
    'MarkAsLegal',
    'MarkNonContactable'
  ];
  String _activity;
  File _activityImage;
  final _remarksController = TextEditingController();
  final _imageController = TextEditingController();
  final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };

  InputType inputType = InputType.both;
  bool editable = true;
  DateTime date;


  Future getActivityImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _activityImage = image;
    });
  }

  void _handleSubmit(BuildContext context) {
    if (_formKey.currentState.validate()) {
      AddActivityApi activityApi =
          AddActivityApi(constants.apiBaseUrl, this.widget.authToken);
      ActivityPayload payload = ActivityPayload(
          allocDetailId: this.widget.allocation.id,
          dispositionCode: _dispositionCode,
          activity: _activity,
          remarks: _remarksController.text,
          ptpDate: date);
      activityApi.savePayment(payload.toMap()).then((res) {
        _showDialog(context);
      }).catchError((Object error) {
        print(error.toString());
      });
    }
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    var content = 'Activity added successfully.';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(_dispositionCode + " confirmation"),
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

  _handleDispositionCodeChange(newValue, FormFieldState state) {
    setState(() {
      _dispositionCode = newValue;
      state.didChange(newValue);
    });
  }

  _handleActivityChange(newValue, FormFieldState state) {
    setState(() {
      _activity = newValue;
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
                  MColDropdownFormField("Activity", _handleActivityChange,
                      _activity, _activities),
                  MColDropdownFormField(
                      "Disposition codes",
                      _handleDispositionCodeChange,
                      _dispositionCode,
                      _dispositionCodes),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your feedback';
                      }
                    },
                    controller: _remarksController,
                    decoration: InputDecoration(labelText: 'Feedback'),
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                  ),
                  (_dispositionCode == 'PTP (Promise to pay)')
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
                          onPressed: this.getActivityImage,
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
