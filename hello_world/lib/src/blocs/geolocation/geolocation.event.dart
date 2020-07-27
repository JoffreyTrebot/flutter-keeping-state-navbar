import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

abstract class GeoLocationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GeoLocationStarted extends GeoLocationEvent {}

class GeoLocationChanged extends GeoLocationEvent {
  final Position position;

  GeoLocationChanged({@required this.position});
}

class GeoLocationNotStarted extends GeoLocationEvent {}