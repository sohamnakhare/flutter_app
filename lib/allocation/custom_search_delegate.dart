import 'package:flutter/material.dart';
import './allocation_account_list.dart';
import '../model/Allocation.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Allocation> allocations;

  CustomSearchDelegate(this.allocations);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return AllocationAccountList(filterAllocations(allocations));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return AllocationAccountList(filterAllocations(allocations));
  }

  List<Allocation> filterAllocations(List<Allocation> allocations) {
    String queryLowerCase = query.toLowerCase();
    List<Allocation> filteredAlloc = allocations.where((account) {
      return account.customerName.toLowerCase().contains(queryLowerCase) ||
          account.accountNo.contains(queryLowerCase);
    }).toList();
    return filteredAlloc == null ? <Allocation>[] : filteredAlloc;
  }
}
