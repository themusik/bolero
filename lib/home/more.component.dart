import 'package:flutter/material.dart';

enum MoreMenu { SETTING, EDIT_GRAPHS }

String displayString (MoreMenu item) {
  String displayString = '';

  switch(item) {
    case MoreMenu.SETTING:
      displayString = "Settings";
      break;
    case MoreMenu.EDIT_GRAPHS:
      displayString = "Edit Tiles";
      break;
  }
  return displayString;
}

