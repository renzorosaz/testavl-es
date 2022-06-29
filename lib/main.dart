import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmovies/core/widget/button/color.dart';
import 'package:testmovies/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:testmovies/features/movies/presentation/pages/movies.dart';
import 'package:testmovies/injection_container.dart';
import 'package:testmovies/navigator.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => di.sl<MoviesBloc>(),
        //  create: (context) => di.sl<MoviesBloc>(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AVALON',
          theme: ThemeData(
            primaryColor: colorPrimary,
            scaffoldBackgroundColor: Colors.white,
            //fontFamily: 'Poppins',
          ),
          home: MoviesScreen(),
        ));
  }
}
