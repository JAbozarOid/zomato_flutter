import 'package:flutter/material.dart';

class MenuSelected extends StatelessWidget {
  final String title;

  MenuSelected({
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
            fontFamily: 'PlayfairDisplay-Bold',
            fontSize: 12,
            color: Color(0xff365eff),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
