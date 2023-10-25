// import 'package:flutter/material.dart';

enum MoreMenu { setting, editGraphs }

String displayString(MoreMenu item) {
  String displayString = '';

  switch (item) {
    case MoreMenu.setting:
      displayString = "Settings";
      break;
    case MoreMenu.editGraphs:
      displayString = "Edit Tiles";
      break;
  }
  return displayString;
}
