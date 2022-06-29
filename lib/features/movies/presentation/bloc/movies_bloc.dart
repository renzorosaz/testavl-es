import 'package:testmovies/core/model/movie_model.dart';
import 'package:testmovies/core/model/server_response.dart';
import 'package:testmovies/features/movies/domain/usecases/movies_use_case.dart';
import 'package:testmovies/features/movies/presentation/bloc/movies_event.dart';
import 'package:testmovies/features/movies/presentation/bloc/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  late final MoviesPopularUseCase moviesPopularUseCase;
  late final MoviesTopRatedUseCase moviesTopRatedUseCase;

  MoviesBloc(
      {required this.moviesPopularUseCase, required this.moviesTopRatedUseCase})
      // ignore: empty_constructor_bodies
      : super(MoviesInitState()) {
    //list popular

    on<MoviesInitEvent>((event, emit) => emit(MoviesInitState()));
    on<OpenPanelEvent>(
        (event, emit) => emit(OpenPanelState(panelType: event.panelType)));

    on<GetMoviesPopularEvent>((event, emit) async {
      emit(MoviesPopularLoadingState());
      final result = await moviesPopularUseCase(MoviesUseCaseParams());
      result.fold((dynamic failure) {
        String message = failure.message;
        emit(GetMoviesErrorState(message: message));
      }, (List<dynamic> listMoviesPopular) {
        emit(GetMoviesPopularState(listMoviesPopular: listMoviesPopular));
      });
    });

    //list top Rated
    on<GetMoviesTopRatedEvent>((event, emit) async {
      emit(MoviesTopLoadingState());
      final result = await moviesTopRatedUseCase(MoviesUseCaseParams());
      result.fold((dynamic failure) {
        String message = failure.message;
        emit(GetMoviesErrorState(message: message));
      }, (dynamic listMoviesTopRated) {
        emit(GetMoviesTopRatedState(listMoviesTopRated: listMoviesTopRated));
      });
    });
  }
}
