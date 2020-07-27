import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'bloc.dart';

class GeoLocationBloc extends Bloc<GeoLocationEvent, GeoLocationState> {
  final Geolocator _geolocator;
  StreamSubscription _geolocationSubscription;

  GeoLocationBloc({@required Geolocator geolocator})
      : assert(geolocator != null),
        _geolocator = geolocator,
        super(GeoLocationInitial());

  @override
  Stream<GeoLocationState> mapEventToState(
    GeoLocationEvent event,
  ) async* {
    if (event is GeoLocationStarted) {
      yield GeoLocationLoadInProgress();
      _geolocationSubscription?.cancel();
      _geolocationSubscription = _geolocator.getPositionStream().listen(
            (Position position) => add(
              GeoLocationChanged(position: position),
            ),
          );
    } else if (event is GeoLocationChanged) {
      yield GeoLocationLoadSuccess(position: event.position);
    }
  }

  // @override
  // GeoLocationState fromJson(Map<String, dynamic> json) {
  //   try {
  //     Position position;
  //     return GeoLocationLoadSuccess(position: position);
  //   } catch (_) {
  //     return null;
  //   }
  // }

  // @override
  // Map<String, dynamic> toJson(GeoLocationState state) {
  //   if (state is GeoLocationLoadSuccess) {
  //     state.position 
  //     return state.position.toJson();
  //   } else {
  //     return null;
  //   }
  // }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }
}
