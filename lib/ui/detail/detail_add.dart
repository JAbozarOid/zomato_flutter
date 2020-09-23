import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';

class DetailAdd extends StatelessWidget {
  final VoidCallback onTap;

  DetailAdd({
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(0.0, 551.0, 375.0, 201.0),
      size: Size(375.0, 752.0),
      pinLeft: true,
      pinRight: true,
      pinBottom: true,
      fixedHeight: true,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: <Widget>[
            Pinned.fromSize(
              bounds: Rect.fromLTWH(0.0, 0.0, 375.0, 201.0),
              size: Size(375.0, 201.0),
              pinLeft: true,
              pinRight: true,
              pinTop: true,
              pinBottom: true,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(44.0),
                  ),
                  color: Color(0xff365eff),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1a000000),
                      offset: Offset(8, 16),
                      blurRadius: 32,
                    ),
                  ],
                ),
              ),
            ),
            Pinned.fromSize(
              bounds: Rect.fromLTWH(133.0, 126.0, 110.0, 22.0),
              size: Size(375.0, 201.0),
              fixedHeight: true,
              child: Text(
                'Add to card',
                style: TextStyle(
                  fontFamily: 'Montserrat-Bold',
                  fontSize: 18,
                  color: Color(0xffffffff),
                  height: 1.3333333333333333,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
