import 'package:flutter/material.dart';
import '../model/Allocation.dart';
import '../model/Account.dart';
import './allocation_account_list.dart';

class AllocationWidget extends StatelessWidget {
  final List<Allocation> allocations;
  final List<Account> accounts = Account.getAccounts();

  AllocationWidget(this.allocations);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: AllocationAccountList(allocations),
        )
      ],
    );
  }
}
