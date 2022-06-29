import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ListVideoFailure extends Failure {
  final String message;

  ListVideoFailure({required this.message});
}

class VerificationFailure extends Failure {
  final String message;

  VerificationFailure({required this.message});
}
