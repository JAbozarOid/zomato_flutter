import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zomato/ui/menu/svg.dart';

class DetailLike extends StatelessWidget {
  final bool isLiked;

  DetailLike({
    @required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(287.0, 16.0, 72.0, 48.0),
      size: Size(375.0, 752.0),
      pinTop: true,
      fixedWidth: true,
      fixedHeight: true,
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
                  topRight: Radius.circular(32.0),
                  bottomLeft: Radius.circular(32.0),
                ),
                color: Color(0xff99adff),
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
                  bounds: Rect.fromLTWH(3.0, 4.5, 18.0, 15.0),
                  size: Size(24.0, 24.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child: SvgPicture.string(
                    isLiked ? svg_v0r4hz : svg_lvs62u,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
