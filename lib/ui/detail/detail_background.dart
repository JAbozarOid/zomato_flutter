import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';

class DetailBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(0.0, 44.0, 375.0, 768.0),
      size: Size(375.5, 812.0),
      pinLeft: true,
      pinRight: true,
      pinTop: true,
      pinBottom: true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0),
          color: Color(0x6ef9f8f7),
        ),
      ),
    );
  }
}
