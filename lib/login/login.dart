import 'package:flutter/material.dart';
import '../splanner/s_planner_page.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(labelText: "Username"),
                  controller: _usernameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your username';
                    }
                  }),
              TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: "Password"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your password';
                    }
                  }),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(8),
                          child: RaisedButton(
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState.validate()) {
                                _usernameController.text == 'admin' && _passwordController.text == 'admin' ?
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SPlannerPage()),
                                ):
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Invalid username password')));
                              }
                            },
                            child: Text('Login'),
                          )),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text('Exit'),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
