import 'package:flutter/material.dart';
import 'package:zomato/ui/home/home_filter_selected.dart';
import 'package:zomato/ui/home/home_filter_unselected.dart';


class HomeFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(top: 16.0),
      children: [
        HomeFilterSelected(
          title: 'Asian',
        ),
        HomeFilterUnselected(
          title: 'American',
        ),
        HomeFilterUnselected(
          title: 'French',
        ),
        HomeFilterUnselected(
          title: 'Mexico',
        ),
      ],
    );
  }
}
