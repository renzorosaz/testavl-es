import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testmovies/features/movies/presentation/pages/movies.dart';

enum Routes {
  MOVIES,
}

class _Paths {
  static const String movies = '/movies';

  static const Map<Routes, String> _pathMap = {
    Routes.MOVIES: _Paths.movies,
  };

  static String? of(Routes route) => _pathMap[route];
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    // Widget page=MoviesScreen();

    Route _pageRoute({page}) {
      return MaterialPageRoute(builder: (context) => page);
    }

    switch (settings.name) {
      case _Paths.movies:
        return _pageRoute(page: MoviesScreen());
      default:
        return _pageRoute(page: MoviesScreen());
    }
  }

  static Future push<T>(Routes route, [T? arguments]) =>
      state.pushNamed(_Paths.of(route)!, arguments: arguments);

  static Future pushNamedAndRemoveUntil<T>(Routes route, [T? arguments]) =>
      state.pushNamedAndRemoveUntil(
        _Paths.of(route)!,
        (Route routes) => false,
        arguments: arguments,
      );

  static Future replaceWith<T>(Routes route, [T? arguments]) =>
      state.pushReplacementNamed(_Paths.of(route)!, arguments: arguments);

  static void pop() => state.pop();

  static void popWithResult(String res) => state.pop(res);

  static NavigatorState get state => navigatorKey.currentState!;
}
