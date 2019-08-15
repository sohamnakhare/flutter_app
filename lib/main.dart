// This example shows a [Scaffold] with an [AppBar], a [BottomAppBar] and a
// [FloatingActionButton]. The [body] is a [Text] placed in a [Center] in order
// to center the text within the [Scaffold] and the [FloatingActionButton] is
// centered and docked within the [BottomAppBar] using
// [FloatingActionButtonLocation.centerDocked]. The [FloatingActionButton] is
// connected to a callback that increments a counter.

import 'package:flutter/material.dart';
import 'mobile-number/mobile_number_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux/store/reducer.dart';
import 'redux/store/AppState.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(appReducer, initialState: AppState.initial());

  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Store<AppState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: this.store,
        child: MaterialApp(
          title: 'Flutter Code Sample for material.Scaffold',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MobileNumberPage(),
        ));
  }
}
