import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:testmovies/core/model/movie_model.dart';
import 'package:testmovies/core/widget/panel/panel_index.dart';

@immutable
abstract class MoviesEvent extends Equatable {}

class MoviesInitEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}

class OpenPanelEvent extends MoviesEvent {
  final PanelType panelType;

  OpenPanelEvent({required this.panelType});

  @override
  List<Object?> get props => [panelType];
}

class ChangeStateCheckbox extends MoviesEvent {
  final bool state;

  ChangeStateCheckbox({required this.state});

  @override
  List<Object?> get props => [state];
}

class GetMoviesPopularEvent extends MoviesEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetMoviesTopRatedEvent extends MoviesEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
