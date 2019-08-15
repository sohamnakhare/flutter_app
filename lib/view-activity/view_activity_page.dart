import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/store/AppState.dart';
import '../redux/actions/actions.dart';
import '../model/Allocation.dart';
import '../model/Activity.dart';
import './view_activity_widget.dart';
import './view_activity_api.dart';
import '../app_constants.dart' as constants;

class ViewActivityPage extends StatelessWidget {
  final Allocation allocation;

  ViewActivityPage(this.allocation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Icon(Icons.person),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: Text(this.allocation.customerName),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: Text(
                      this.allocation.accountNo,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        body: StoreConnector<AppState, _ViewModel>(
            onInit: (store) {
              ViewActivityApi activityApi = ViewActivityApi(
                  constants.apiBaseUrl, store.state.authState.token);
              activityApi.getActivitiesByAllocId(allocation.id).then((res) {
                store.dispatch(StoreActivities(res));
              }).catchError((Object error) {
                print("error");
              });
            },
            converter: (Store<AppState> store) => _ViewModel.create(store),
            builder: (BuildContext context, _ViewModel viewModel) {
              return ViewActivityWidget(allocation, viewModel.activities);
            }));
  }
}

class _ViewModel {
  final String authToken;
  final List<Activity> activities;

  _ViewModel({this.authToken, this.activities});

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
        authToken: store.state.authState.token,
        activities: store.state.allocState.activities);
  }
}
