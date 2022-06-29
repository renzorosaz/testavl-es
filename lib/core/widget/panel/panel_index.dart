import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:testmovies/core/model/movie_model.dart';
import 'package:testmovies/core/widget/panel/container_draggable.dart';

enum PanelType { none, movies, detailMovie }
enum TypeInvoice { movies }

class PanelIndex extends StatelessWidget {
  final PanelType panelType;
  final Animation<double> tweenAnimation;
  final Animation<double> tweenAnimationOut;
  final ScrollController scrollController;
  final Function()? handledActiveAnimation;
  final MovieModel movieModel;
  final List<MovieModel> listMovies;
  final List<MovieModel>? listMoviesFiltered;
  final AnimationController animationController;
  late Animation<double> tweenAnimationSelectCheckbox;
  late Animation<double> tweenAnimationSelectCheckboxOut;

  PanelIndex(
      {Key? key,
      this.panelType = PanelType.movies,
      required this.movieModel,
      required this.tweenAnimation,
      required this.tweenAnimationOut,
      required this.scrollController,
      required this.handledActiveAnimation,
      this.listMovies = const [],
      this.listMoviesFiltered = const [],
      required this.animationController,
      required this.tweenAnimationSelectCheckbox,
      required this.tweenAnimationSelectCheckboxOut})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return handledGeneratePanel();
  }

  Widget handledGeneratePanel() {
    switch (panelType) {
      case PanelType.detailMovie:
        return ContainerDraggable(
          scrollController: scrollController,
          typeInvoice: TypeInvoice.movies,
          animationController: animationController,
          containerDraggableType: ContainerDraggableType.movies,
          handledActiveAnimation: handledActiveAnimation ?? () {},
          movieModel: movieModel,
          tweenAnimationOut: tweenAnimationOut,
          tweenAnimation: tweenAnimation,
          tweenAnimationSelectCheckboxOut: tweenAnimationSelectCheckboxOut,
          tweenAnimationSelectCheckbox: tweenAnimationSelectCheckbox,
        );
      case PanelType.movies:
        return Container();
      case PanelType.none:
        return Container();
    }
  }
}
