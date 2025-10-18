import 'package:flutter/material.dart';

class STextStyles {
  STextStyles(this.fontFamily, this.color);

  factory STextStyles.defaults(final Color defColor) => STextStyles('Inter', defColor);

  final String fontFamily;
  final Color color;

  /// Заголовки, которые используются для экранов с информированием
  TextStyle h1({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: weight ?? FontWeight.w700,
    height: 1.2,
    color: color ?? this.color,
  );

  /// Применяется для главного заголовка на странице
  TextStyle h2({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: weight ?? FontWeight.w700,
    height: 1.2,
    color: color ?? this.color,
  );

  /// Заголовки смысловых блоков
  TextStyle t1({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: weight ?? FontWeight.w600,
    height: 1.2,
    color: color ?? this.color,
  );

  /// Заголовки для групп виджетов, например, группа инпутов
  TextStyle t2({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: weight ?? FontWeight.w600,
    height: 1.2,
    color: color ?? this.color,
  );

  /// Набор текста. Используется в основном в списках ключ-значение, нужен для выделения значений в списке.
  TextStyle body({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: weight ?? FontWeight.w400,
    height: 1.4,
    color: color ?? this.color,
  );

  /// Набор текста. Используется для обычных текстовых блоков
  TextStyle body2({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: weight ?? FontWeight.w400,
    height: 1.4,
    color: color ?? this.color,
  );

  /// Используется для мелкого текста, например, в баннерах или навбаре.
  TextStyle interlinear({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: weight ?? FontWeight.w400,
    height: 1.4,
    color: color ?? this.color,
  );

  //Buttons
  TextStyle button({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: weight ?? FontWeight.w500,
    height: 1.5,
    color: color ?? this.color,
  );

  TextStyle textButton({final Color? color, final FontWeight? weight}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: weight ?? FontWeight.w500,
    height: 1.4,
    color: color ?? this.color,
  );
}
