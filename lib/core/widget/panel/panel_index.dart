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
  final List<MovieModel>? listMoviesFiltered;
  final AnimationController animationController;
  late Animation<double> tweenAnimationSelectCheckbox;
  late Animation<double> tweenAnimationSelectCheckboxOut;
  final PanelController panelController;
  PanelIndex(
      {Key? key,
      this.panelType = PanelType.movies,
      required this.tweenAnimation,
      required this.tweenAnimationOut,
      required this.panelController,
      required this.scrollController,
      required this.handledActiveAnimation,
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
      case PanelType.movies:
        return ContainerDraggable(
          scrollController: scrollController,
          typeInvoice: TypeInvoice.movies,
          animationController: animationController,
          containerDraggableType: ContainerDraggableType.movies,
          handledActiveAnimation: handledActiveAnimation ?? () {},
          tweenAnimationOut: tweenAnimationOut,
          tweenAnimation: tweenAnimation,
          tweenAnimationSelectCheckboxOut: tweenAnimationSelectCheckboxOut,
          tweenAnimationSelectCheckbox: tweenAnimationSelectCheckbox,
        );
      case PanelType.detailMovie:
        return Container();
      case PanelType.none:
        return Container();
    }
  }
}
