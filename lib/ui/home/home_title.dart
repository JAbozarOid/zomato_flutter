import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Food & Delivery',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
          color: Color(0xff000000),
        ),
      ),
    );
  }
}
