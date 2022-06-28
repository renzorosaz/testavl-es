import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmovies/core/widget/button/color.dart';
import 'package:testmovies/navigator.dart';
//import 'injection_container.dart' as di;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        //MultiBlocProvider(
        // providers: [
        //   // BLOC MOVIES
        // ],
        MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'AVALON',
            theme: ThemeData(
              primaryColor: colorPrimary,
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'Poppins',
            ),
            navigatorKey: AppNavigator.navigatorKey,
            onGenerateRoute: AppNavigator.onGenerateRoute);
    //  );
  }
}
