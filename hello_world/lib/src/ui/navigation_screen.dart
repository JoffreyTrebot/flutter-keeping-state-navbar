import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hello_world/src/blocs/bottom_navigation/bloc.dart';
import 'package:hello_world/src/blocs/geolocation/bloc.dart';

import 'home/home.dart';
import 'map/map.dart';

class NavigationScreen extends StatelessWidget {
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (BuildContext context, BottomNavigationState state) {
            if (state is PageLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is FirstPageLoaded) {
              return HomePage(
                key: PageStorageKey('FeedPage'),
              );
            }
            if (state is SecondPageLoaded) {
              return BlocProvider(
                create: (BuildContext context) =>
                    GeoLocationBloc(geolocator: Geolocator())
                      ..add(GeoLocationStarted()),
                child: MapPage(
                  key: PageStorageKey('MapPage'),
                ),
              );
            }
            return Container();
          },
        ),
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (BuildContext context, BottomNavigationState state) {
          return BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex:
                BlocProvider.of<BottomNavigationBloc>(context).currentIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Accueil'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.navigation),
                title: Text('Map'),
              ),
            ],
            onTap: (index) =>
                BlocProvider.of<BottomNavigationBloc>(context).add(
              PageTapped(index: index),
            ),
          );
        },
      ),
    );
  }
}
