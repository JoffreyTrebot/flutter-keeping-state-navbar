import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/src/blocs/bottom_navigation/bloc.dart';
import 'package:hello_world/src/simple_bloc_observer.dart';
import 'package:hello_world/src/ui/navigation_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build();
  runApp(App());
}

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      home: BlocProvider<BottomNavigationBloc>(
        create: (context) => BottomNavigationBloc()..add(AppStarted()),
        child: NavigationScreen(),
      ),
    );
  }
}
