class ListMoviesException implements Exception {
  final String message;

  ListMoviesException({required this.message});
}

class GeneralException implements Exception {
  final String msg;

  GeneralException(this.msg);

  @override
  String toString() => msg;
}

class VerificationException implements Exception {
  final String message;

  VerificationException({required this.message});
}
