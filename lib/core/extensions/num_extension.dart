import 'package:flutter/cupertino.dart';

extension SizeExtension on num {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());

  EdgeInsets get toPaddingAll => EdgeInsets.all(toDouble());

  EdgeInsets get toPaddingSymmetricHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());

  EdgeInsets get toPaddingSymmetricVertical =>
      EdgeInsets.symmetric(vertical: toDouble());
}
