import 'package:get_it/get_it.dart';
import 'package:testmovies/features/movies/data/datasources/movies_data_sources.dart';
import 'package:testmovies/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:testmovies/features/movies/domain/repositories/movies_repository.dart';
import 'package:testmovies/features/movies/domain/usecases/movies_use_case.dart';
import 'package:testmovies/features/movies/presentation/bloc/movies_bloc.dart';

import 'core/services/center_api.dart';

final sl = GetIt.instance;

init() async {
  //=======================
  // Blocs
  //=======================
  sl.registerFactory(() =>
      MoviesBloc(moviesPopularUseCase: sl(), moviesTopRatedUseCase: sl()));

  //=======================
  // Use cases
  //=======================
  sl.registerLazySingleton(
      () => MoviesPopularUseCase(moviesPopularRepository: sl()));
  sl.registerLazySingleton(
      () => MoviesTopRatedUseCase(moviesTopRatedRepository: sl()));

  //=======================
  // Repositories
  //=======================

  sl.registerLazySingleton<MoviesPopularRepository>(
      () => MoviesRepositoryImpl(moviesDataSource: sl()));
  sl.registerLazySingleton<MoviesTopRatedRepository>(
      () => MoviesTopRatedImpl(moviesDataSource: sl()));

  //=======================
  // DataSource
  //=======================
  sl.registerLazySingleton<MoviesDataSource>(
      () => MoviesDataSourceImpl(centerApi: sl()));
  //=======================
  // Network
  //=======================
  sl.registerLazySingleton<CenterApi>(() => CenterApi());
}
