import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/src/blocs/geolocation/bloc.dart';
import 'package:hello_world/src/ui/map/google_maps.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GeoLocationBloc, GeoLocationState>(
        builder: (BuildContext context, state) {
          if (state is GeoLocationLoadSuccess) {
            return GoogleMaps();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
