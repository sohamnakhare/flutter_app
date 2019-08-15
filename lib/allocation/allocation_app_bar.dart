import 'package:flutter/material.dart';
import './custom_search_delegate.dart';
import '../model/Allocation.dart';


class AllocationAppBar extends StatelessWidget {
  final List<Allocation> allocations;

  AllocationAppBar(this.allocations);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Icon(Icons.credit_card),
        Expanded(
          child: Text('  Allocation'),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(allocations),
            );
          },
        )
      ],
    );
  }
}
