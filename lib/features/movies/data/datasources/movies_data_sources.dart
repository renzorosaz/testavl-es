import 'package:testmovies/core/errors/exceptions.dart';
import 'package:testmovies/core/model/movie_model.dart';
import 'package:testmovies/core/services/center_api.dart';
import 'package:testmovies/core/util/server.dart';

import '../../../../core/model/server_response.dart';

abstract class MoviesDataSource {
  Future<dynamic> getMoviesPopular();
  Future<dynamic> getMoviesTopRated();
}

class MoviesDataSourceImpl implements MoviesDataSource {
  late final CenterApi centerApi;
  MoviesDataSourceImpl({required this.centerApi});

  @override
  Future<List<dynamic>> getMoviesPopular() async {
    try {
      dynamic serverResponse =
          await centerApi.get(urlSpecific: Server.getPopulars);

      if (serverResponse['results'] != null) {
        List<dynamic> body = serverResponse['results'];
        return body;
      } else {
        throw ListMoviesException(message: "error");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  @override
  Future<List<dynamic>> getMoviesTopRated() async {
    try {
      dynamic serverResponse =
          await centerApi.get(urlSpecific: Server.getTopRated);

      if (serverResponse['results'] != null) {
        List<dynamic> body = serverResponse['results'];
        return body;
      } else {
        throw ListMoviesException(message: "error");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
