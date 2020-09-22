import 'package:flutter/material.dart';

class HomeListTitle extends StatelessWidget {
  final String title;

  HomeListTitle({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            color: Color(0xff373737),
            height: 1.25,
          ),
        ),
      ),
    );
  }
}
