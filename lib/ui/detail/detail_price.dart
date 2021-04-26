import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';

class DetailPrice extends StatelessWidget {
  final int price;

  DetailPrice({
    @required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(32.0, 373.0, 83.0, 29.0),
      size: Size(375.0, 752.0),
      fixedHeight: true,
      child: Text(
        '\$$price',
        style: TextStyle(
          fontFamily: 'Montserrat-SemiBold',
          fontSize: 24,
          color: Color(0xff365eff),
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
