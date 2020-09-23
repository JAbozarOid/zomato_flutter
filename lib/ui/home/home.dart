import 'package:flutter/material.dart';
import 'package:zomato/bloc/bloc.dart';
import 'package:zomato/model/fake_restaurant.dart';
import 'package:zomato/model/nearby_restaurants.dart';
import 'package:zomato/ui/detail/detail.dart';
import 'package:zomato/ui/detail/detail_popular_fake.dart';
import 'package:zomato/ui/home/home_card_popular.dart';
import 'package:zomato/ui/home/home_view_all.dart';
import 'home_card.dart';
import 'home_filter.dart';
import 'home_list_title.dart';
import 'home_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List<RestaurantModel> nearYouList;
  List<RestaurantModel> popularList;

  double _lat;
  double _lon;

  void getNearbyRestaurants() async {
    final restaurantBloc = BlocProvider.of<RestaurantsBloc>(context);
    restaurantBloc.add(GetNearbyRestaurants(_lat, _lon));
  }

  @override
  void initState() {
    super.initState();
    _buildFakeData();

    Location().getLocation().then(
      (locationData) {
        _lat = locationData.latitude;
        _lon = locationData.longitude;
        if ((_lat != null) && (_lon != null)) {
          getNearbyRestaurants();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        children: [
          HomeTitle(),
          Expanded(
            flex: 1,
            child: HomeFilter(),
          ),
          HomeListTitle(
            title: 'Near you',
          ),
          Expanded(
              flex: 4,
              child: BlocListener<RestaurantsBloc, RestaurantsState>(
                listener: (context, state) {
                  if (state is RestauranstsError) {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                child: BlocBuilder<RestaurantsBloc, RestaurantsState>(
                  builder: (context, state) {
                    if (state is RestaurantsInitial) {
                      return Container();
                    } else if (state is RestaurantsLoading) {
                      return buildLoading();
                    } else if (state is RestaurantsLoaded) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.restaurants.length,
                        itemBuilder: (context, position) {
                          NearbyRestaurants mRestaurant =
                              state.restaurants[position];
                          return HomeCard(
                            onTap: _onTapNearYou,
                            mRestaurant: mRestaurant,
                          );
                        },
                      );
                    } else if (state is RestauranstsError) {
                      return Container(
                        child: Text(state.message),
                      );
                    }
                  },
                ),
              )),
          HomeListTitle(
            title: 'Popular',
          ),
          Expanded(
            flex: 4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularList.length,
              itemBuilder: (context, position) {
                RestaurantModel mRestaurant = popularList[position];
                return HomeCardPopular(
                  onTap: _onTapPopular,
                  mRestaurant: mRestaurant,
                );
              },
            ),
          ),
          HomeViewAll(
            onTap: _onTapViewAll,
          ),
        ],
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _onTapNearYou(NearbyRestaurants mRestaurant) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => BlocProvider.value(
              value: BlocProvider.of<RestaurantsBloc>(context),
              child: DetailScreen(
                mRestaurant: mRestaurant,
              ),
            )));
    getNearbyRestaurants();
  }

  void _onTapPopular(RestaurantModel mRestaurant) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => PopularDetailScreenFake(mRestaurant: mRestaurant,)));
  }

  void _onTapViewAll() {}

  void _buildFakeData() {
    //nearYouList = List<RestaurantModel>();
    /* nearYouList.add(RestaurantModel(
      imageUrl: 'https://b.zmtcdn.com/data/pictures/8/16774318/b16e382e9f6696f911b600b7e5ca6839.jpg?output-format=webp',
      price: 10.00,
      name: 'Chicken 1',
      description: 'Fresh hamburger with chicken, salad, tomatoes.',
      isLiked: true,
    )); */
    /* nearYouList.add(RestaurantModel(
      imageUrl: 'https://b.zmtcdn.com/data/pictures/8/16774318/b16e382e9f6696f911b600b7e5ca6839.jpg?output-format=webp',
      price: 20.00,
      name: 'Chicken 2',
      description: 'Fresh hamburger with chicken, salad, tomatoes.',
      isLiked: true,
    )); */
    /*  nearYouList.add(RestaurantModel(
      imageUrl: 'https://b.zmtcdn.com/data/pictures/8/16774318/b16e382e9f6696f911b600b7e5ca6839.jpg?output-format=webp',
      price: 30.00,
      name: 'Chicken 3',
      description: 'Fresh hamburger with chicken, salad, tomatoes.',
      isLiked: false,
    )); */

    popularList = List<RestaurantModel>();
    popularList.add(RestaurantModel(
      imageUrl:
          'https://b.zmtcdn.com/data/pictures/8/16774318/b16e382e9f6696f911b600b7e5ca6839.jpg?output-format=webp',
      price: 40.00,
      name: 'Chicken 4',
      description: 'Fresh hamburger with chicken, salad, tomatoes.',
      isLiked: false,
    ));
    popularList.add(RestaurantModel(
      imageUrl:
          'https://b.zmtcdn.com/data/pictures/8/16774318/b16e382e9f6696f911b600b7e5ca6839.jpg?output-format=webp',
      price: 50.00,
      name: 'Chicken 5',
      description: 'Fresh hamburger with chicken, salad, tomatoes.',
      isLiked: true,
    ));
    popularList.add(RestaurantModel(
      imageUrl:
          'https://b.zmtcdn.com/data/pictures/8/16774318/b16e382e9f6696f911b600b7e5ca6839.jpg?output-format=webp',
      price: 60.00,
      name: 'Chicken 6',
      description: 'Fresh hamburger with chicken, salad, tomatoes.',
      isLiked: true,
    ));
    popularList.add(RestaurantModel(
      imageUrl:
          'https://b.zmtcdn.com/data/pictures/8/16774318/b16e382e9f6696f911b600b7e5ca6839.jpg?output-format=webp',
      price: 70.00,
      name: 'Chicken 7',
      description: 'Fresh hamburger with chicken, salad, tomatoes.',
      isLiked: false,
    ));
  }
}
