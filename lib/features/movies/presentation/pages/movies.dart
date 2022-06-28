import 'package:flutter/material.dart';
import 'package:testmovies/core/util/scaffold_theme.dart';

class MoviesScreen extends StatefulWidget {
  MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldTheme(
        statusBarBrightness: Brightness.light,
        navBarColor: Colors.white,
        child: Scaffold());
  }
}
