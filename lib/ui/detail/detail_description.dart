import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';

class DetailDescription extends StatelessWidget {
  final String description;

  DetailDescription({
    @required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(32.0, 452.0, 215.0, 54.0),
      size: Size(375.0, 752.0),
      fixedWidth: true,
      fixedHeight: true,
      child: Text(
        description,
        style: TextStyle(
          fontFamily: 'Montserrat-Regular',
          fontSize: 12,
          color: Color(0xff656565),
          height: 1.5,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
