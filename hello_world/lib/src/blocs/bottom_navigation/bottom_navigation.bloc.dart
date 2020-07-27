import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bottom_navigation.event.dart';
import 'bottom_navigation.state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  int currentIndex = 0;

  BottomNavigationBloc() : super(PageLoading());

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      this.add(PageTapped(index: this.currentIndex));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      if (this.currentIndex == 0) {
        yield FirstPageLoaded();
      }
      if (this.currentIndex == 1) {
        yield SecondPageLoaded();
      }
    }
  }
}
