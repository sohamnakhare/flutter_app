import 'package:flutter/material.dart';

class MColDropdownFormField extends StatelessWidget {

  final String label;
  final value;
  final Function onChanged;
  final List<String> options;

  MColDropdownFormField(this.label, this.onChanged, this.value, this.options);

  void handleOnChanged(newValue, FormFieldState state) {
    onChanged(newValue, state);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return       new FormField(validator: (value) {
      if (value == null || value == '') {
        return 'Please select '+label;
      }
    }, builder: (FormFieldState state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InputDecorator(
              decoration: InputDecoration(
                labelText: label,
              ),
              isEmpty: value == '',
              child: new DropdownButtonHideUnderline(
                child: new DropdownButton(
                  value: value,
                  isDense: true,
                  onChanged: (newValue){
                    this.handleOnChanged(newValue, state);
                  },
                  items: options.map((value) {
                    return new DropdownMenuItem(
                      value: value,
                      child: new Text(value.toString()),
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
    });
  }

}