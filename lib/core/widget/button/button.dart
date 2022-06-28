import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testmovies/core/widget/button/button_index.dart';

class ButtonPrimary extends StatelessWidget {
  final Size size;
  final Color? color;
  final String label;
  final SizeButton sizeButton;
  final ColorButton colorButton;

  const ButtonPrimary({
    Key? key,
    this.color,
    required this.size,
    required this.label,
    required this.sizeButton,
    required this.colorButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: handledGenerateSize(sizeButton)["height"],
      width: handledGenerateSize(sizeButton)["width"],
      alignment: Alignment.center,
      decoration: handledGenerateBoxDecorationColor(colorButton),
      child: Text(
        label,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Map<String, double> handledGenerateSize(SizeButton sizeButton) {
    switch (sizeButton) {
      case SizeButton.long:
        return {
          "height": size.height * 0.071,
          "width": size.width * 0.88,
        };
      case SizeButton.medium:
        return {
          "height": size.height * 0.071,
          "width": size.width * 0.70,
        };
      case SizeButton.small:
        return {
          "height": size.height * 0.071,
          "width": size.width * 0.30,
        };
    }
  }

  BoxDecoration handledGenerateBoxDecorationColor(ColorButton colorButton) {
    switch (colorButton) {
      case ColorButton.dark:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorPrimary,
        );
      case ColorButton.light:
        return BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorPrimary,
            border: Border.all(
              color: colorPrimary,
              width: 1.5,
            ));
      case ColorButton.disable:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? Colors.grey,
        );
    }
  }
}

Color colorPrimary = const Color.fromRGBO(0, 61, 111, 0);
