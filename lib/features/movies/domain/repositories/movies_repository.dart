import 'package:testmovies/core/model/movie_model.dart';
import 'package:testmovies/core/model/server_response.dart';

import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesPopularRepository {
  Future<Either<Failure, List<dynamic>>> getMoviesPopular();
}

abstract class MoviesTopRatedRepository {
  Future<Either<Failure, List<dynamic>>> getMoviesTopRated();
}
