import 'package:flutter/material.dart';
import 'package:testmovies/core/model/movie_model.dart';
import 'package:testmovies/core/util/scaffold_theme.dart';
import 'package:testmovies/core/widget/panel/panel_index.dart';

class MoviesContainer extends StatelessWidget {
  final VoidCallback onScrollDown;
  final VoidCallback onScrollUp;
  final VoidCallback handledClosePanel;
  final List<MovieModel>? listMovies;
  final List<MovieModel>? listMoviesFiltered;
  final Function(PanelType) handledOpenPanel;

  const MoviesContainer(
      {Key? key,
      this.listMovies,
      this.listMoviesFiltered,
      required this.handledOpenPanel,
      required this.onScrollDown,
      required this.onScrollUp,
      required this.handledClosePanel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldTheme(
        statusBarBrightness: Brightness.dark,
        navBarColor: Colors.white,
        child: Scaffold(
          appBar: AppBar(),
        ));
  }
}
