import 'package:testmovies/core/errors/exceptions.dart';
import 'package:testmovies/core/model/movie_model.dart';
import 'package:testmovies/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:testmovies/features/movies/data/datasources/movies_data_sources.dart';
import 'package:testmovies/features/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesPopularRepository {
  late final MoviesDataSource moviesDataSource;

  MoviesRepositoryImpl({required this.moviesDataSource});

  @override
  Future<Either<Failure, List<MovieModel>>> getMoviesPopular() async {
    try {
      final result = await moviesDataSource.getMoviesPopular();
      return Right(result);
    } on VerificationException catch (e) {
      return Left(VerificationFailure(message: e.message));
    }
  }
}

class MoviesTopRatedImpl implements MoviesTopRatedRepository {
  late final MoviesDataSource moviesDataSource;

  MoviesTopRatedImpl({required this.moviesDataSource});

  @override
  Future<Either<Failure, List<MovieModel>>> getMoviesTopRated() async {
    try {
      final result = await moviesDataSource.getMoviesTopRated();
      return Right(result);
    } on VerificationException catch (e) {
      return Left(VerificationFailure(message: e.message));
    }
  }
}
