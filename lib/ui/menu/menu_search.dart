import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'svg.dart';

class MenuSearch extends StatelessWidget {
  final VoidCallback onTap;

  MenuSearch({
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 24.0,
          height: 24.0,
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
                bounds: Rect.fromLTWH(15.0, 15.0, 6.0, 6.0),
                size: Size(24.0, 24.0),
                pinRight: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  svg_x9i07p,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(4.0, 4.0, 14.0, 14.0),
                size: Size(24.0, 24.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  svg_hucw6b,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
