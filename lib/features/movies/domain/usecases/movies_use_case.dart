import 'package:testmovies/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:testmovies/core/model/server_response.dart';
import 'package:testmovies/core/usecases/use_cases.dart';
import 'package:testmovies/features/movies/domain/repositories/movies_repository.dart';

import '../../../../core/model/movie_model.dart';

class MoviesPopularUseCase extends UseCase<dynamic, MoviesUseCaseParams> {
  late final MoviesPopularRepository moviesPopularRepository;

  MoviesPopularUseCase({required this.moviesPopularRepository});

  @override
  Future<Either<Failure, List<dynamic>>> call(MoviesUseCaseParams params) {
    return moviesPopularRepository.getMoviesPopular();
  }
}

class MoviesUseCaseParams {
  MoviesUseCaseParams();
}

class MoviesTopRatedUseCase
    extends UseCase<List<dynamic>, MoviesUseCaseParams> {
  late final MoviesTopRatedRepository moviesTopRatedRepository;
  MoviesTopRatedUseCase({required this.moviesTopRatedRepository});
  @override
  Future<Either<Failure, List<dynamic>>> call(MoviesUseCaseParams params) {
    return moviesTopRatedRepository.getMoviesTopRated();
  }
}
