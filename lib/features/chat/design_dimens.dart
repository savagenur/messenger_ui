import 'package:flutter/widgets.dart';

class DesignDimens {
  // Thickness
  static const double thickness = 1;
  static const double bitThickness = 2;

  // Padding
  static const double emptyPadding = 0;
  static const double tooLittlePadding = 1;
  static const double littlePadding = 2;
  static const double smallPadding = 4;
  static const double tinyPadding = 5;
  static const double mediumPadding = 8;
  static const double smallActionButtonPadding = 6;
  static const double bigPadding = 10;
  static const double lilBiggerThenBigPadding = 11;
  static const double largePadding = 16;
  static const double hugePadding = 20;
  static const double doubleLargePadding = 32;
  static const double doubleHugePadding = 36;
  static const double giantPadding = 55;
  static const double tooGiantPadding = 70;

  // Radius
  static const double smallRadius = 5;
  static const double mediumRadius = 8;
  static const double bigRadius = 10;
  static const double largeRadius = 12;
  static const double hugeRadius = 15;
  static const double giantRadius = 34;

  // Emptiness
  static const double tooLittleEmptiness = 1;
  static const double littleEmptiness = 2;
  static const double smallEmptiness = 5;
  static const double mediumEmptiness = 10;
  static const double bigEmptiness = 15;
  static const double largeEmptiness = 24;
  static const double floatActionBtnEmptiness = 60;
}

extension ToEdgeInsets on double {
  EdgeInsets get all => EdgeInsets.all(this);

  EdgeInsets get top => EdgeInsets.only(top: this);

  EdgeInsets get right => EdgeInsets.only(right: this);

  EdgeInsets get bottom => EdgeInsets.only(bottom: this);

  EdgeInsets get left => EdgeInsets.only(left: this);

  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: this);

  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: this);

  BorderRadius get radius => BorderRadius.circular(this);

  EdgeInsets asEdgeInsetsWith({
    double? top,
    double? right,
    double? bottom,
    double? left,
  }) =>
      EdgeInsets.only(
        top: top ?? this,
        right: right ?? this,
        bottom: bottom ?? this,
        left: left ?? this,
      );
}

extension ToSizedBox on double {
  /// @return [SizedBox] with [height] equal to [this]
  SizedBox get verticalBox => SizedBox(height: this);

  /// @return [SizedBox] with [width] equal to [this]
  SizedBox get horizontalBox => SizedBox(width: this);

  /// @return [SizedBox] with [width] and [height] equal to [this]
  SizedBox get squareBox => SizedBox(width: this, height: this);
}
