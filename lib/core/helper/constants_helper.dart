import 'package:flutter/material.dart';
import 'package:testmovies/core/util/screen_size.dart';

class AppConstants {
  AppConstants._internal();
  static final AppConstants _instance = AppConstants._internal();

  static AppConstants get instance => _instance;
  double appBarHeight(BuildContext context) {
    double _size;
    AppBar _appBar = AppBar();
    _size = _appBar.preferredSize.height + MediaQuery.of(context).padding.top;
    return _size;
  }

  EdgeInsets paddingCard() {
    return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0);
  }

  static const throttleDurationExpenses = Duration(milliseconds: 2000);

  static BorderRadiusGeometry borderRadius(BuildContext context) =>
      BorderRadius.only(
        topLeft: Radius.circular(ScreenSize.width(context) * 0.08),
        topRight: Radius.circular(ScreenSize.width(context) * 0.08),
      );
  static double borderRadiusValue(BuildContext context) =>
      ScreenSize.width(context) * 0.08;

  static double borderNumberKeyboard = 2.2;

  DateTime maxDateTime = DateTime(2030);
  DateTime minDateTime = DateTime(2000);

  static const int sizePageInfinityScroll = 30;
}
