import 'package:flutter/material.dart';
import 'package:testmovies/core/widget/button/button.dart';

enum TypeButton {
  button,
}

enum SizeButton {
  long,
  small,
  medium,
}

enum ColorButton {
  dark,
  light,
  disable,
}

class ButtonIndex extends StatelessWidget {
  final Color? color;
  final String label;
  final IconData? icon;
  final bool? isActive;
  final bool? isLoading;
  static late Size size;
  final IconData? iconSecond;
  final SizeButton? sizeButton;
  final Function() handledButton;
  final TypeButton? typeButton;
  final ColorButton? colorButton;
  final Function()? onTap;

  const ButtonIndex({
    Key? key,
    this.color,
    this.onTap,
    required this.label,
    this.isActive = true,
    this.isLoading = false,
    required this.handledButton,
    this.icon = Icons.attach_money,
    this.sizeButton = SizeButton.long,
    this.typeButton = TypeButton.button,
    this.colorButton = ColorButton.dark,
    this.iconSecond = Icons.remove_red_eye,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return isLoading!
        ? const CircularProgressIndicator()
        : GestureDetector(
            onTap: () {
              if (isActive!) {
                handledButton();
              }
            },
            child: generateButtonWidget(typeButton!),
          );
  }

  Widget generateButtonWidget(TypeButton typeButton) {
    switch (typeButton) {
      case TypeButton.button:
        return ButtonPrimary(
          size: size,
          label: label,
          color: color,
          sizeButton: sizeButton!,
          colorButton: colorButton!,
        );
    }
  }
}
