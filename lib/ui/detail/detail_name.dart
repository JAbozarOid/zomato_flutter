import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';

class DetailName extends StatelessWidget {
  final String name;

  DetailName({
    @required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(32.0, 407.0, 212.0, 32.0),
      size: Size(375.0, 752.0),
      fixedHeight: true,
      child: Text(
        name,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
          color: Color(0xff373737),
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
