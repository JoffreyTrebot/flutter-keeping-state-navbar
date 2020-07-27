import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

abstract class GeoLocationState extends Equatable {
  @override
  List<Object> get props => [];
}

class GeoLocationInitial extends GeoLocationState {}

class GeoLocationLoadInProgress extends GeoLocationState {}

class GeoLocationLoadSuccess extends GeoLocationState {
  final Position position;

  GeoLocationLoadSuccess({@required this.position});
}

class GeoLocationNotLoaded extends GeoLocationState {}