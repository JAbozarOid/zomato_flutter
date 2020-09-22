import 'package:flutter/material.dart';
import 'package:zomato/model/fake_restaurant.dart';
import 'package:zomato/ui/home/home_view_all.dart';
import 'home_card.dart';
import 'home_filter.dart';
import 'home_list_title.dart';
import 'home_title.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<RestaurantModel> nearYouList;
  List<RestaurantModel> popularList;

  @override
  void initState() {
    _buildFakeData();
    super.initState();
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nearYouList.length,
              itemBuilder: (context, position) {
                RestaurantModel mRestaurant = nearYouList[position];
                return HomeCard(
                  onTap: () => _onTapNearYou(mRestaurant),
                  mRestaurant: mRestaurant,
                );
              },
            ),
          ),
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
                return HomeCard(
                  onTap: () => _onTapPopular(mRestaurant),
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

  void _onTapNearYou(RestaurantModel mRestaurant) {}

  void _onTapPopular(RestaurantModel mRestaurant) {}

  void _onTapViewAll() {}

  void _buildFakeData() {
    nearYouList = List<RestaurantModel>();
    nearYouList.add(RestaurantModel(
      imageUrl: 'https://b.zmtcdn.com/data/pictures/8/16774318/b16e382e9f6696f911b600b7e5ca6839.jpg?output-format=webp',
      price: 10.00,
      name: 'Chicken 1',
      description: 'Fresh hamburger with chicken, salad, tomatoes.',
      isLiked: true,
    ));
    nearYouList.add(RestaurantModel(
      imageUrl: 'https://b.zmtcdn.com/data/pictures/8/16774318/b16e382e9f6696f911b600b7e5ca6839.jpg?output-format=webp',
      price: 20.00,
      name: 'Chicken 2',
      description: 'Fresh hamburger with chicken, salad, tomatoes.',
      isLiked: true,
    ));
    nearYouList.add(RestaurantModel(
      imageUrl: 'https://b.zmtcdn.com/data/pictures/8/16774318/b16e382e9f6696f911b600b7e5ca6839.jpg?output-format=webp',
      price: 30.00,
      name: 'Chicken 3',
      description: 'Fresh hamburger with chicken, salad, tomatoes.',
      isLiked: false,
    ));

    popularList = List<RestaurantModel>();
    popularList.add(RestaurantModel(
      imageUrl: 'https://b.zmtcdn.com/data/pictures/8/16774318/b16e382e9f6696f911b600b7e5ca6839.jpg?output-format=webp',
      price: 40.00,
      name: 'Chicken 4',
      description: 'Fresh hamburger with chicken, salad, tomatoes.',
      isLiked: false,
    ));
    popularList.add(RestaurantModel(
      imageUrl: 'https://b.zmtcdn.com/data/pictures/8/16774318/b16e382e9f6696f911b600b7e5ca6839.jpg?output-format=webp',
      price: 50.00,
      name: 'Chicken 5',
      description: 'Fresh hamburger with chicken, salad, tomatoes.',
      isLiked: true,
    ));
    popularList.add(RestaurantModel(
      imageUrl: 'https://b.zmtcdn.com/data/pictures/8/16774318/b16e382e9f6696f911b600b7e5ca6839.jpg?output-format=webp',
      price: 60.00,
      name: 'Chicken 6',
      description: 'Fresh hamburger with chicken, salad, tomatoes.',
      isLiked: true,
    ));
    popularList.add(RestaurantModel(
      imageUrl: 'https://b.zmtcdn.com/data/pictures/8/16774318/b16e382e9f6696f911b600b7e5ca6839.jpg?output-format=webp',
      price: 70.00,
      name: 'Chicken 7',
      description: 'Fresh hamburger with chicken, salad, tomatoes.',
      isLiked: false,
    ));
  }
}
