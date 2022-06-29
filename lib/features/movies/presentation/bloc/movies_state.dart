import 'package:testmovies/core/model/movie_model.dart';
import 'package:testmovies/core/model/server_response.dart';
import 'package:testmovies/core/widget/panel/panel_index.dart';

abstract class MoviesState {}

class MoviesInitState extends MoviesState {}

class OpenPanelState extends MoviesState {
  final PanelType panelType;

  OpenPanelState({required this.panelType});
}

class IsSelectedFilterState extends MoviesState {
  final bool isSelectedFilterState;
  IsSelectedFilterState({required this.isSelectedFilterState});
}

class GetMoviesPopularState extends MoviesState {
  final List<dynamic> listMoviesPopular;
  GetMoviesPopularState({required this.listMoviesPopular});
}

class GetMoviesTopRatedState extends MoviesState {
  final List<dynamic> listMoviesTopRated;
  GetMoviesTopRatedState({required this.listMoviesTopRated});
}

class GetMoviesErrorState extends MoviesState {
  late final String message;

  GetMoviesErrorState({required this.message});
}

class MoviesPopularLoadingState extends MoviesState {}

class MoviesTopLoadingState extends MoviesState {}
