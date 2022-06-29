import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScaffoldTheme extends StatefulWidget {
  final Widget child;
  final Color statusBarColor;
  final Color navBarColor;
  final Brightness statusBarBrightness;

  const ScaffoldTheme({
    Key? key,
    required this.child,
    this.statusBarBrightness = Brightness.dark,
    this.statusBarColor = Colors.transparent,
    this.navBarColor = Colors.black,
  }) : super(key: key);

  @override
  _ScaffoldThemeState createState() => _ScaffoldThemeState();
}

class _ScaffoldThemeState extends State<ScaffoldTheme> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: widget.statusBarColor,
          statusBarIconBrightness: widget.statusBarBrightness,
          systemNavigationBarColor: widget.navBarColor,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemStatusBarContrastEnforced: false),
      child: AnimatedTheme(
          duration: const Duration(milliseconds: 500),
          data: Theme.of(context),
          curve: Curves.easeInOutExpo,
          child: widget.child),
    );
  }
}
