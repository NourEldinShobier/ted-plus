import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TAppBarController extends ChangeNotifier {
  bool _dropShadow = false;

  ScrollController shadowController;

  void init() {
    shadowController.addListener(() {
      double offset = shadowController.offset;

      if (offset == 0 && _dropShadow) {
        _dropShadow = false;
        notifyListeners();
      }
      if (offset > 0 && !_dropShadow) {
        _dropShadow = true;
        notifyListeners();
      }
    });
  }

  void searchButton_onPressed() {}
  void accountImage_onPressed() {}

  get dropShadow => _dropShadow;
}
