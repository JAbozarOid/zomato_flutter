import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:zomato/bloc/restaurants_bloc.dart';
import 'package:zomato/model/nearby_restaurants.dart';
import 'package:zomato/ui/detail/detail_like.dart';
import 'package:zomato/ui/detail/detail_play.dart';
import 'package:zomato/ui/detail/detail_price.dart';

import 'detail_add.dart';
import 'detail_background.dart';
import 'detail_description.dart';
import 'detail_image.dart';
import 'detail_name.dart';
import 'detail_quality.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  final NearbyRestaurants mRestaurant;

  DetailScreen({
    @required this.mRestaurant,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count;

  NearbyRestaurants get mRestaurant => widget.mRestaurant;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<RestaurantsBloc>(context)
      ..add(GetRestaurantDetail(mRestaurant.restaurant.id));
  }

  @override
  void initState() {
    count = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: SizedBox(
            width: 480.0,
            height: 812.0,
            child: BlocListener<RestaurantsBloc, RestaurantsState>(
              listener: (context, state) {
                if (state is RestauranstsError) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              child: BlocBuilder<RestaurantsBloc, RestaurantsState>(
                builder: (context, state) {
                  if (state is RestaurantsLoading) {
                    return buildLoading();
                  } else if (state is RestaurantDetailLoaded) {
                    return Stack(
                      children: <Widget>[
                        DetailBackground(),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 60.0, 479.5, 752.0),
                          size: Size(480.0, 812.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Stack(
                            children: <Widget>[
                              DetailAdd(
                                onTap: _onTapAdd,
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 163.0, 479.5, 489.0),
                                size: Size(479.5, 752.0),
                                pinLeft: true,
                                pinRight: true,
                                fixedHeight: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(44.0),
                                      bottomRight: Radius.circular(11.0),
                                      bottomLeft: Radius.circular(44.0),
                                    ),
                                    color: Color(0xffedf0ff),
                                  ),
                                ),
                              ),
                              DetailQuality(
                                onTapPlus: _onTapPlus,
                                onTapMinus: _onTapMinus,
                                count: count,
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 479.5, 560.0),
                                size: Size(479.5, 752.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                fixedHeight: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(44.0),
                                      topRight: Radius.circular(44.0),
                                      bottomRight: Radius.circular(11.0),
                                      bottomLeft: Radius.circular(44.0),
                                    ),
                                    color: Color(0xfffcf9f7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x1a000000),
                                        offset: Offset(8, -16),
                                        blurRadius: 32,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DetailDescription(
                                description: mRestaurant.restaurant.name,
                              ),
                              DetailPrice(
                                price: mRestaurant.restaurant.priceRange,
                              ),
                              DetailName(
                                name: mRestaurant.restaurant.cuisines,
                              ),
                              DetailImage(
                                imageUrl:
                                    'https://b.zmtcdn.com/data/pictures/8/16774318/b16e382e9f6696f911b600b7e5ca6839.jpg?output-format=webp',
                              ),
                              DetailPlay(
                                onTap: _onTapPlay,
                              ),
                              DetailLike(
                                isLiked:
                                    mRestaurant.restaurant.includeBogoOffers,
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(176.0, 8.0, 24.0, 4.0),
                                size: Size(479.5, 752.0),
                                pinTop: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.5),
                                    color: Color(0xff365eff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (state is RestauranstsError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w900),
                      ),
                    );
                  }
                },
                //
              ),
            )),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _onTapAdd() {}

  void _onTapPlay() {}

  void _onTapPlus() {
    setState(() => count++);
  }

  void _onTapMinus() {
    if (count > 1) setState(() => count--);
  }
}
