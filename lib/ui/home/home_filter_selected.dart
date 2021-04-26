import 'package:flutter/material.dart';

class HomeFilterSelected extends StatelessWidget {
  final String title;

  HomeFilterSelected({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.0),
          bottomLeft: Radius.circular(16.0),
        ),
        color: Color(0xffedf0ff),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Montserrat-Medium',
            fontSize: 12,
            color: Color(0xff365eff),
          ),
        ),
      ),
    );
  }
}
