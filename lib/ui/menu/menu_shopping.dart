import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'svg.dart';

class MenuShopping extends StatelessWidget {
  final VoidCallback onTap;

  MenuShopping({
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            width: 24.0,
            height: 24.0,
            child: Stack(
              children: [
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 0.0, 24.0, 24.0),
                  size: Size(24.0, 24.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child: Container(
                    decoration: BoxDecoration(),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(3.6, 0.5, 16.8, 23.0),
                  size: Size(24.0, 24.0),
                  pinTop: true,
                  pinBottom: true,
                  fixedWidth: true,
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(5.2, 0.0, 6.4, 5.0),
                        size: Size(16.8, 23.0),
                        pinTop: true,
                        fixedWidth: true,
                        fixedHeight: true,
                        child: SvgPicture.string(
                          svg_smpafo,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(3.9, 7.0, 2.0, 2.0),
                        size: Size(16.8, 23.0),
                        fixedWidth: true,
                        fixedHeight: true,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                            border: Border.all(width: 1.0, color: Color(0xff111111)),
                          ),
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(10.9, 7.0, 2.0, 2.0),
                        size: Size(16.8, 23.0),
                        fixedWidth: true,
                        fixedHeight: true,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                            border: Border.all(width: 1.0, color: Color(0xff111111)),
                          ),
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 5.0, 16.8, 18.0),
                        size: Size(16.8, 23.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child: SvgPicture.string(
                          svg_5mhuvd,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.2, 20.0, 16.3, 1.0),
                        size: Size(16.8, 23.0),
                        pinLeft: true,
                        pinRight: true,
                        pinBottom: true,
                        fixedHeight: true,
                        child: SvgPicture.string(
                          svg_kr8mfj,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
