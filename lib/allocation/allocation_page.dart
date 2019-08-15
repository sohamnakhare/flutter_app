import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/store/AppState.dart';
import '../redux/actions/actions.dart';
import '../model/Allocation.dart';
import './allocation_widget.dart';
import './allocation_app_bar.dart';
import '../app_drawer.dart';
import './allocation_api.dart';
import '../app_constants.dart' as constants;

class AllocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        onInit: (store) {
          AllocationApi allocApi =
              AllocationApi(constants.apiBaseUrl, store.state.authState.token);
          allocApi.getAllocationByUser().then((res) {
            store.dispatch(StoreAllocations(res));
          }).catchError((Object error) {
            print("error");
          });
        },
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel viewModel) {
          return Scaffold(
              appBar: AppBar(title: AllocationAppBar(viewModel.allocations)),
              drawer: AppDrawer(),
              body: AllocationWidget(viewModel.allocations),
              bottomNavigationBar: BottomAppBar(
                child: Container(
                  height: 50.0,
                ),
              ));
        });
  }
}

class _ViewModel {
  final String authToken;
  final List<Allocation> allocations;
  final Function(List<Allocation>) storeAllocations;

  _ViewModel({this.authToken, this.allocations, this.storeAllocations});

  factory _ViewModel.create(Store<AppState> store) {
    _storeAllocations(List<Allocation> allocations) {
      store.dispatch(StoreAllocations(allocations));
    }

    return _ViewModel(
        authToken: store.state.authState.token,
        allocations: store.state.allocState.allocations,
        storeAllocations: _storeAllocations);
  }
}
