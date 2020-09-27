import 'package:flutter/material.dart';
import 'package:zomato/app/repositories/data_repository.dart';
import 'package:zomato/app/services/api.dart';
import 'package:zomato/app/services/api_service.dart';
import 'package:zomato/bloc/restaurants_bloc.dart';
import 'package:zomato/ui/alert/show_alert_dialog.dart';
import 'package:zomato/ui/home/home.dart';
import 'package:zomato/ui/menu/menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

enum ConnectionState { disconnected, connected, loading }

class Nagigation extends StatefulWidget {
  @override
  _NagigationState createState() => _NagigationState();
}

class _NagigationState extends State<Nagigation> {
  var _onConnectionState = PublishSubject<ConnectionState>();

  void checkNetworkConnection() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      _onConnectionState.add(ConnectionState.connected);
    } else {
      _onConnectionState.add(ConnectionState.disconnected);
      showAlertDialog(
          context: context,
          title: 'Connection Error',
          content: 'Could not retrive data. Please try again later',
          defaultActionText: 'OK');
      print(DataConnectionChecker().lastTryResults);
    }
  }

  @override
  void initState() {
    super.initState();
    _onConnectionState.add(ConnectionState.loading);
    checkNetworkConnection();
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
              child: StreamBuilder<ConnectionState>(
                  stream: _onConnectionState,
                  builder: (context, snapshot) {
                    switch (snapshot.data) {
                      case ConnectionState.disconnected:
                        return Center(
                          child: Text(
                            'Please check your Netwrok connection',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w900),
                          ),
                        );
                        break;
                      case ConnectionState.connected:
                        return BlocProvider(
                          create: (context) => RestaurantsBloc(
                              DataRepository(APIService(API.sandbox()))),
                          child: HomeScreen(),
                        );
                        break;
                      case ConnectionState.loading:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                    }
                    return (!snapshot.hasData)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container();
                  })),
        ],
      ),
    );
  }
}
