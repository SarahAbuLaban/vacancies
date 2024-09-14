import 'package:flutter/material.dart';

import 'colors.dart';

class NormalTextStyle extends TextStyle {
  final double? size;
  final Color? textColor;

  const NormalTextStyle({this.size, this.textColor});

  @override
  double? get fontSize => size ?? 17.0;

  @override
  FontWeight? get fontWeight => FontWeight.normal;

  @override
  Color? get color => textColor ?? Colors.black;
}

class BoldTextStyle extends TextStyle {
  final double? size;
  final Color? textColor;

  const BoldTextStyle({this.size, this.textColor});

  @override
  double? get fontSize => size ?? 17.0;

  @override
  FontWeight? get fontWeight => FontWeight.bold;

  @override
  Color? get color => textColor ?? Colors.black;
}


class SmallTextStyle extends TextStyle {
  final double? size;
  final Color? textColor;

  const SmallTextStyle({this.size, this.textColor});

  @override
  double? get fontSize => size ?? 14.0;

  @override
  FontWeight? get fontWeight => FontWeight.normal;

  @override
  Color? get color => textColor ?? Colors.black;
}
