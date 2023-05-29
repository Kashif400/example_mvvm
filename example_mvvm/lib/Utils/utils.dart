import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          title: 'Error',
          message: message,
          duration: Duration(seconds: 3),
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(15),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(20),
          reverseAnimationCurve: Curves.bounceInOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            size: 20,
            color: Colors.white,
          ),
        )..show(context));
  }

  static snackBar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
