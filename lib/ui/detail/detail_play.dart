import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'svg.dart';

class DetailPlay extends StatelessWidget {
  final VoidCallback onTap;

  DetailPlay({
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(152.0, 179.0, 72.0, 48.0),
      size: Size(375.0, 752.0),
      fixedWidth: true,
      fixedHeight: true,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: <Widget>[
            Pinned.fromSize(
              bounds: Rect.fromLTWH(0.0, 0.0, 72.0, 48.0),
              size: Size(72.0, 48.0),
              pinLeft: true,
              pinRight: true,
              pinTop: true,
              pinBottom: true,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100.0),
                    topRight: Radius.circular(32.0),
                    bottomRight: Radius.circular(100.0),
                    bottomLeft: Radius.circular(32.0),
                  ),
                  color: Color(0x99373737),
                ),
              ),
            ),
            Pinned.fromSize(
              bounds: Rect.fromLTWH(24.0, 12.0, 24.0, 24.0),
              size: Size(72.0, 48.0),
              fixedWidth: true,
              fixedHeight: true,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 24.0, 24.0),
                    size: Size(24.0, 24.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      svg_9750qa,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(7.9, 4.0, 10.0, 16.0),
                    size: Size(24.0, 24.0),
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child: SvgPicture.string(
                      svg_7imk1l,
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
    );
  }
}
