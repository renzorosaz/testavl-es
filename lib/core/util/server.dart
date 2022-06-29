class Server {
  // Endpoints
  static const String _moviedb = 'https://api.themoviedb.org/3/movie/';

  //https://api.themoviedb.org/3/movie/
  //getPopulars
  static const String getPopulars =
      "${_moviedb}popular?api_key=34738023d27013e6d1b995443764da44";

  //https://api.themoviedb.org/3/movie/
  //getTopRated
  static const String getTopRated =
      "${_moviedb}top_rated?api_key=34738023d27013e6d1b995443764da44";
}
