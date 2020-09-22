import 'package:flutter/material.dart';

class HomeViewAll extends StatelessWidget {
  final VoidCallback onTap;

  HomeViewAll({
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0, top: 16.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100.0),
                topRight: Radius.circular(26.0),
                bottomRight: Radius.circular(100.0),
                bottomLeft: Radius.circular(26.0),
              ),
              color: Color(0xff365eff),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            child: Text(
              'View All',
              style: TextStyle(
                fontFamily: 'Montserrat-SemiBold',
                fontSize: 18,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
