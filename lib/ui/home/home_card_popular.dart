import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zomato/model/fake_restaurant_model.dart';
import 'package:zomato/ui/menu/svg.dart';


class HomeCardPopular extends StatelessWidget {
  final Function onTap;
  final FakeRestaurantModel mRestaurant;

  HomeCardPopular({
    @required this.onTap,
    @required this.mRestaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: InkWell(
        onTap: () => onTap(mRestaurant),
        child: SizedBox(
          width: 154.0,
          height: 168.0,
          child: Stack(
            children: <Widget>[
              Pinned.fromSize(
                bounds: Rect.fromLTWH(16.0, 8.0, 138.0, 160.0),
                size: Size(154.0, 168.0),
                pinLeft: true,
                pinRight: true,
                pinTop: true,
                pinBottom: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: Color(0xffffffff),
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
                bounds: Rect.fromLTWH(106.0, 16.0, 40.0, 32.0),
                size: Size(154.0, 168.0),
                pinRight: true,
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 40.0, 32.0),
                      size: Size(40.0, 32.0),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2.0),
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(2.0),
                            bottomLeft: Radius.circular(20.0),
                          ),
                          color: Color(0xff99adff),
                        ),
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(8.0, 4.0, 24.0, 24.0),
                      size: Size(40.0, 32.0),
                      pinTop: true,
                      pinBottom: true,
                      fixedWidth: true,
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
                              mRestaurant.isLiked ? svg_v0r4hz : svg_lvs62u,
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
              Pinned.fromSize(
                bounds: Rect.fromLTWH(0.0, 0.0, 75.0, 75.0),
                size: Size(154.0, 168.0),
                pinLeft: true,
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: CircleAvatar(
                  radius: 52.5,
                  backgroundColor: Color(0xffd8d8d8),
                  backgroundImage: NetworkImage(mRestaurant.imageUrl),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(35.0, 83.0, 101.0, 69.0),
                size: Size(154.0, 168.0),
                pinRight: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 43.0, 131.0, 26.0),
                      size: Size(131.0, 69.0),
                      pinLeft: true,
                      pinRight: true,
                      pinBottom: true,
                      fixedHeight: true,
                      child: Text(
                        mRestaurant.description,
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 10,
                          color: Color(0xff656565),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 48.0, 18.0),
                      size: Size(131.0, 69.0),
                      fixedHeight: true,
                      child: Text(
                        '\$${mRestaurant.price}',
                        style: TextStyle(
                          fontFamily: 'Montserrat-SemiBold',
                          fontSize: 14,
                          color: Color(0xff365eff),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 20.0, 123.0, 19.0),
                      size: Size(131.0, 69.0),
                      fixedHeight: true,
                      child: Text(
                        mRestaurant.name,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: Color(0xff373737),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
