part of 'bottom_navigation.bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();
}

class HomeState extends BottomNavigationState {
  final int index = 0;
  final String title = 'Home';

  @override
  List<Object> get props => [index, title];
}

class MapState extends BottomNavigationState {
  final int index = 1;
  final String title = 'Map';

  @override
  List<Object> get props => [index, title];
}