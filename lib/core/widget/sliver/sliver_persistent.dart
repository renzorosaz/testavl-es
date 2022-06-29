import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:testmovies/core/helper/constants_helper.dart';
import 'package:testmovies/core/widget/button/color.dart';

double _maxAppBarHeight = 120;
double _minAppBarHeight = 80;

//font size
double _maxTitleSize = 24.0;
double _minTitleSize = 18.0;

double _maxSizedBoxHeight = 12;
double _minSizedBoxHeight = 0;

//icon size
double _maxIconSize = 28.0;
double _minIconSize = 12.0;

//.shadow values
double _maxShadow = 16.0;
double _minShadow = 4.0;

// border radius
double _maxBorderRadius = 20.0;
double _minBorderRadius = 1.0;

class SliverPersistenceSimple extends SliverPersistentHeaderDelegate {
  ///Title with max 12 characters
  final String title;

  /// OnTap function to Back Button
  final VoidCallback? onTap;

  /// Enable/Disable Back Button. False by default
  final bool? enableBackButton;

  SliverPersistenceSimple(
      {required this.title, this.onTap, this.enableBackButton = false});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double _appBarHeight = AppConstants.instance.appBarHeight(context);
    double _appBarHeightMinTemp = _appBarHeight - (Platform.isIOS ? 10 : 0);
    double _appBarHeightMaxTemp = _appBarHeight + 30;
    _minAppBarHeight = _appBarHeightMinTemp;
    _maxAppBarHeight = _appBarHeightMaxTemp < _appBarHeightMinTemp
        ? _appBarHeightMinTemp + 10
        : _appBarHeightMaxTemp;

    final _percent = shrinkOffset / _maxAppBarHeight;

    final percent = shrinkOffset / _maxAppBarHeight;
    final double _titleSize =
        (_maxTitleSize * (1 - percent)).clamp(_minTitleSize, _maxTitleSize);

    final double _iconSize =
        (_maxIconSize * (1 - _percent)).clamp(_minIconSize, _maxIconSize);

    final double _shrinkOpacity =
        (_maxTitleSize * (1 - percent)).clamp(0.1, 1.0);

    final double _shrinkShadow =
        (_maxIconSize * (1 - percent)).clamp(_minShadow, _maxShadow);

    final double _shrinkBorderRadius = (((_maxAppBarHeight - 30) /
                (maxExtent - minExtent) *
                _maxBorderRadius) -
            (shrinkOffset / (maxExtent - minExtent) * _maxBorderRadius))
        .clamp(_minBorderRadius, _maxBorderRadius);

    final _shrinkSizedBoxHeight = (_maxSizedBoxHeight * (1 - _percent))
        .clamp(_minSizedBoxHeight, _maxSizedBoxHeight);

    final double _shrink =
        (shrinkOffset / (maxExtent - minExtent) * 1).clamp(0.0, 1.0);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(_shrinkBorderRadius),
          bottomRight: Radius.circular(_shrinkBorderRadius),
        ),
        color: Color.lerp(const Color.fromRGBO(0, 61, 111, 1),
            const Color.fromRGBO(0, 61, 111, 1), _shrink),
        boxShadow: [
          BoxShadow(
              blurRadius: _shrinkShadow, color: Colors.grey.withOpacity(0.6))
        ],
      ),
      child: Stack(children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Opacity(
                opacity: _shrinkOpacity,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 0),
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 0),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Center(
                            child: Text(title,
                                style: TextStyle(
                                    fontSize: 23, color: Colors.white))),
                      )),
                ),
              ),
              SizedBox(
                height: _shrinkSizedBoxHeight,
              ),
            ]),
      ]),
    );
  }

  @override
  double get maxExtent => _maxAppBarHeight;

  @override
  double get minExtent => _minAppBarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _ToggleButtons extends StatefulWidget {
  final double space;
  final int indexButton;
  final double fontSize;
  final double iconCategorySize;
  final Function(int) onChangeCategory;
  final double paddingHorizontalCategories;

  _ToggleButtons(
      {Key? key,
      required this.space,
      required this.indexButton,
      required this.fontSize,
      required this.iconCategorySize,
      required this.onChangeCategory,
      required this.paddingHorizontalCategories})
      : super(key: key);

  @override
  State<_ToggleButtons> createState() => __ToggleButtonsState();
}

class __ToggleButtonsState extends State<_ToggleButtons> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
