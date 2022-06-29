import 'package:flutter/material.dart';
import 'package:testmovies/core/util/screen_size.dart';
import 'package:testmovies/core/widget/panel/panel_index.dart';

import '../../model/movie_model.dart';

enum ContainerDraggableType { movies }

class ContainerDraggable extends StatelessWidget {
  final Animation<double> tweenAnimation;
  final Function() handledActiveAnimation;
  final Animation<double> tweenAnimationOut;
  final AnimationController animationController;
  final ContainerDraggableType containerDraggableType;
  final TypeInvoice typeInvoice;
  final ScrollController scrollController;

  late Animation<double> tweenAnimationSelectCheckbox;
  late Animation<double> tweenAnimationSelectCheckboxOut;

  ContainerDraggable(
      {Key? key,
      required this.typeInvoice,
      required this.tweenAnimation,
      required this.scrollController,
      required this.handledActiveAnimation,
      required this.tweenAnimationOut,
      required this.animationController,
      required this.containerDraggableType,
      required this.tweenAnimationSelectCheckbox,
      required this.tweenAnimationSelectCheckboxOut})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ScreenSize.width(context) * 0.05),
              topRight: Radius.circular(ScreenSize.width(context) * 0.05),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
        ));
  }
}
