import 'package:flutter/material.dart';
import 'package:testmovies/core/widget/generic_error_dialog.dart';

showGenericErrorMessage(
    BuildContext context, String message, Function() onTapButton) {
  showGeneralDialog(
      context: context,
      pageBuilder: (context, _, __) {
        return GenericErrorDialog(
          description: message,
          onTap: onTapButton,
        );
      });
}
