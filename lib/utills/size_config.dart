import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app/utills/strings.dart';
import 'imports.dart';

class SizeConfig {
  static double width;
  static double height;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      width = constraints.maxWidth;
      height = constraints.maxHeight;
      isPortrait = true;
      if (width < 450) {
        isMobilePortrait = true;
      }
    } else {
      width = constraints.maxHeight;
      height = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = width / 100;
    _blockHeight = height / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
    print("_blockHeight : ${_blockHeight}");
    print("_blockWidth : ${_blockWidth}");
  }

  // fix multiplier for iphone 11 pro max
  static double defaultHeightMultiplier;
  static double defaultWidthMultiplier;

  static double sizes(double size, [String heightOrWidth]) {
    if (SizeConfig.heightMultiplier < 7.5) {
      defaultHeightMultiplier = 7.1;
      defaultWidthMultiplier = 3.8;
    } else {
      defaultHeightMultiplier = 8.96;
      defaultWidthMultiplier = 4.14;
    }

    if (heightOrWidth == Strings.widths) {
      var multiplier = size / defaultWidthMultiplier;
      return SizeConfig.widthMultiplier * multiplier;
    } else {
      var multiplier = size / defaultHeightMultiplier;
      return SizeConfig.heightMultiplier * multiplier;
    }
  }
}
