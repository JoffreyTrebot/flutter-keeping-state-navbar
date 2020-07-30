import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hello_world/src/blocs/bottom_navigation/bottom_navigation.bloc.dart';
import 'package:hello_world/src/blocs/geolocation/bloc.dart';

import 'home/home.dart';
import 'map/map.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final screens = <Widget>[
    HomePage(),
    BlocProvider(
      create: (BuildContext context) =>
          GeoLocationBloc(geolocator: Geolocator())..add(GeoLocationStarted()),
      child: MapPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (BuildContext context, BottomNavigationState state) {
        if (state is HomeState) {
          return buildHomepage(currentIndex: state.index);
        }
        if (state is MapState) {
          return buildHomepage(currentIndex: state.index);
        }
        return Container(
          color: Colors.red,
        );
      },
    );
  }

  Scaffold buildHomepage({int currentIndex}) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey[500],
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        onTap: (index) {
          if (index == 0) {
            return BlocProvider.of<BottomNavigationBloc>(context)
              ..add(LoadHome());
          }
          if (index == 1) {
            return BlocProvider.of<BottomNavigationBloc>(context)
              ..add(LoadMap());
          }

          return BlocProvider.of<BottomNavigationBloc>(context)
            ..add(LoadHome());
        },
        items: [
          _buildTabBarItem(icon: Icon(Icons.home), label: 'Home'),
          _buildTabBarItem(icon: Icon(Icons.navigation), label: 'Map'),
        ],
      ),
    );
  }

  _buildTabBarItem({final Widget icon, final String label}) {
    return BottomNavigationBarItem(
      icon: icon,
      title: Text(
        label,
        style: TextStyle(fontSize: 14.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
