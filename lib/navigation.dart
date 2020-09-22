import 'package:flutter/material.dart';
import 'package:zomato/app/repositories/data_repository.dart';
import 'package:zomato/app/services/api.dart';
import 'package:zomato/app/services/api_service.dart';
import 'package:zomato/bloc/restaurants_bloc.dart';
import 'package:zomato/ui/home/home.dart';
import 'package:zomato/ui/menu/menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Nagigation extends StatefulWidget {
  @override
  _NagigationState createState() => _NagigationState();
}

class _NagigationState extends State<Nagigation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Menu(),
          ),
          Expanded(
              flex: 4,
              child: BlocProvider(
                create: (context) =>
                    RestaurantsBloc(DataRepository(APIService(API.sandbox()))),
                child: HomeScreen(),
              )),
        ],
      ),
    );
  }
}
