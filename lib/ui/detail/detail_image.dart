import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  final String imageUrl;

  DetailImage({
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Pinned.fromSize(
      bounds: Rect.fromLTWH(65.0, 80.0, 245.0, 245.0),
      size: Size(375.0, 752.0),
      fixedWidth: true,
      fixedHeight: true,
      child: Pinned.fromSize(
        bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 245.0),
        size: Size(245.0, 245.0),
        pinLeft: true,
        pinRight: true,
        pinTop: true,
        pinBottom: true,
        child: CircleAvatar(
          radius: 122.5,
          backgroundColor: Color(0xffd8d8d8),
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
