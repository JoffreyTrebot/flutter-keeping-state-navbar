part of 'bottom_navigation.bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();
}

class LoadHome extends BottomNavigationEvent{
  @override
  List<Object> get props => [];

}
class LoadMap extends BottomNavigationEvent{
  @override
  List<Object> get props => [];

}