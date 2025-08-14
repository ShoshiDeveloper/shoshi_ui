import 'package:flutter/material.dart';

class STextStyles {
  STextStyles(this.fontFamily);

  static final defaults = STextStyles('Inter');

  final String fontFamily;

  TextStyle h1({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: weight ?? FontWeight.w700,
    height: 1.2,
    color: color,
  );

  TextStyle t1({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: weight ?? FontWeight.w700,
    height: 1.2,
    color: color,
  );

  TextStyle t2({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: weight ?? FontWeight.w700,
    height: 1.2,
    color: color,
  );

  TextStyle body({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: weight ?? FontWeight.w400,
    height: 1.4,
    color: color,
  );

  TextStyle body2({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: weight ?? FontWeight.w400,
    height: 1.4,
    color: color,
  );

  TextStyle caption({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: weight ?? FontWeight.w400,
    height: 1.4,
    color: color,
  );

  //Buttons

  TextStyle button({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: weight ?? FontWeight.w500,
    height: 1.5,
    color: color,
  );
  TextStyle textButton({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: weight ?? FontWeight.w500,
    height: 1.4,
    color: color,
  );
}
