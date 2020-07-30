import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation.event.dart';
part 'bottom_navigation.state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(HomeState());

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is LoadHome) {
      yield HomeState();
    }
    if (event is LoadMap) {
      yield MapState();
    }
  }
}
