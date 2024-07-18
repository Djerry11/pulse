import 'package:flutter/widgets.dart';

class UsernameController {
  var isValidated = false;
  Widget? errorWidget;
  //------------------------Username not availabe Error widget --------------------------------------
  void errorWidgetBuilder(String? value) {
    if (isValidated == false) {
      errorWidget = Text('The username $value is already taken');
    } else {
      errorWidget = null;
    }
  }

  //------------------------Username Suggestion Suggestion widget --------------------------------------
  Widget? suggestionBuilder() {
    return const Text('Suggestion');
  }

  //------------------------Username onValueChanged --------------------------------------
  onValueChanged(String? value) {
    if (value == null) {
      isValidated = false;
      errorWidgetBuilder(value);
    } else {
      isValidated = true;
      errorWidgetBuilder(value);
    }
  }
}
