import 'package:testmovies/core/model/movie_model.dart';

import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesPopularRepository {
  Future<Either<Failure, List<MovieModel>>> getMoviesPopular();
}

abstract class MoviesTopRatedRepository {
  Future<Either<Failure, List<MovieModel>>> getMoviesTopRated();
}
