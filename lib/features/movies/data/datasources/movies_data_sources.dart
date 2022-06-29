import 'package:testmovies/core/errors/exceptions.dart';
import 'package:testmovies/core/model/movie_model.dart';
import 'package:testmovies/core/services/center_api.dart';
import 'package:testmovies/core/util/server.dart';

import '../../../../core/model/server_response.dart';

abstract class MoviesDataSource {
  Future<List<MovieModel>> getMoviesPopular();
  Future<List<MovieModel>> getMoviesTopRated();
}

class MoviesDataSourceImpl implements MoviesDataSource {
  late final CenterApi centerApi;
  MoviesDataSourceImpl({required this.centerApi});

  @override
  Future<List<MovieModel>> getMoviesPopular() async {
    try {
      ServerResponseModel serverResponse =
          await centerApi.get(urlSpecific: Server.getPopulars);

      if (serverResponse.results.isNotEmpty) {
        final body = serverResponse.results;
        List<MovieModel> _list = body;

        return _list;
      } else {
        throw ListMoviesException(message: "error");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getMoviesTopRated() async {
    try {
      ServerResponseModel serverResponse =
          await centerApi.get(urlSpecific: Server.getTopRated);

      if (serverResponse.results.isNotEmpty) {
        final body = serverResponse.results;
        List<MovieModel> _list = body;

        return _list;
      } else {
        throw ListMoviesException(message: "error");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
