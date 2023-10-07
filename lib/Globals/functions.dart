import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

customErrorMessage(context,{required String message}){
  showTopSnackBar(
        snackBarPosition: SnackBarPosition.bottom,
        Overlay.of(context),
         CustomSnackBar.error(
          message: message,
        ),
      );
}


customSuccessMessage(context,{required String message}){
  showTopSnackBar(
        snackBarPosition: SnackBarPosition.bottom,
        Overlay.of(context),
         CustomSnackBar.success(
          message: message,
        ),
      );
}