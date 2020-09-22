import 'package:flutter/material.dart';

class MenuUnselected extends StatelessWidget {
  final String title;

  MenuUnselected({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: -1.5708,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 11,
            color: Color(0xff000000),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
