import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';

class DetailQuality extends StatelessWidget {
  final VoidCallback onTapPlus;
  final VoidCallback onTapMinus;
  final int count;

  DetailQuality({
    @required this.onTapPlus,
    @required this.onTapMinus,
    @required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(32.0, 584.0, 311.0, 44.0),
      size: Size(375.0, 752.0),
      fixedWidth: true,
      fixedHeight: true,
      child: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(167.0, 0.0, 44.0, 44.0),
            size: Size(311.0, 44.0),
            pinTop: true,
            pinBottom: true,
            fixedWidth: true,
            child: InkWell(
              onTap: onTapMinus,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 44.0, 44.0),
                    size: Size(44.0, 44.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(14.0, 21.0, 16.0, 2.0),
                    size: Size(44.0, 44.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 16.0, 2.0),
                          size: Size(16.0, 2.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.0),
                              color: Color(0xff365eff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(267.0, 0.0, 44.0, 44.0),
            size: Size(311.0, 44.0),
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            fixedWidth: true,
            child: InkWell(
              onTap: onTapPlus,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 44.0, 44.0),
                    size: Size(44.0, 44.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(14.0, 14.0, 16.0, 16.0),
                    size: Size(44.0, 44.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 7.0, 16.0, 2.0),
                          size: Size(16.0, 16.0),
                          pinLeft: true,
                          pinRight: true,
                          fixedHeight: true,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.0),
                              color: Color(0xff365eff),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 7.0, 16.0, 2.0),
                          size: Size(16.0, 16.0),
                          pinTop: true,
                          pinBottom: true,
                          fixedWidth: true,
                          child: Transform.rotate(
                            angle: 1.5708,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.0),
                                color: Color(0xff365eff),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(0.0, 11.0, 65.0, 22.0),
            size: Size(311.0, 44.0),
            fixedHeight: true,
            child: Text(
              'Quality',
              style: TextStyle(
                fontFamily: 'Montserrat-Medium',
                fontSize: 18,
                color: Color(0xff656565),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(235.0, 11.0, 7.0, 22.0),
            size: Size(311.0, 44.0),
            fixedHeight: true,
            child: Text(
              '$count',
              style: TextStyle(
                fontFamily: 'Montserrat-Bold',
                fontSize: 18,
                color: Color(0xff656565),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
