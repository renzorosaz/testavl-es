import 'package:flutter/material.dart';
import 'package:testmovies/core/widget/button/button_index.dart';

class GenericErrorDialog extends StatelessWidget {
  final String title;
  final String description;
  final String buttonTitle;
  final Function() onTap;

  const GenericErrorDialog({
    Key? key,
    this.title = "¡UY!",
    required this.description,
    this.buttonTitle = "Volver",
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      body: Center(
        child: Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
          margin: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 19),
              const Text(
                "Ha ocurrido un error",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 19),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ButtonIndex(label: buttonTitle, handledButton: onTap))
            ],
          ),
        ),
      ),
    );
  }
}
