// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

abstract class UiComponents {}

class Toast extends UiComponents {
  String message;
  Toast({
    required this.message,
  });
}

class Snackbar extends UiComponents {
  String message;
  CallbackAction? action;
  Snackbar({required this.message, this.action});
}

class Alert extends UiComponents {
  String title;
  String message;
  CallbackAction? action;
  Alert({required this.title, required this.message, this.action});
}

class Dialog extends UiComponents {
  String title;
  String message;
  CallbackAction? positiveAction;
  CallbackAction? negativeAction;
  CallbackAction? cancelledAction;
  Dialog(
      {required this.title,
      required this.message,
      this.positiveAction,
      this.negativeAction,
      this.cancelledAction});
}
