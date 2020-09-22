import 'package:flutter/material.dart';

class HomeFilterUnselected extends StatelessWidget {
  final String title;

  HomeFilterUnselected({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Montserrat-Medium',
            fontSize: 12,
            color: Color(0xff656565),
          ),
        ),
      ),
    );
  }
}
