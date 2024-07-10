import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final double? fontSize;
  final FontWeight? fontWeight;
  final String text;
  final String? fontFamily;
  final Color? color;
  final Color? decorationColor;
  final double? height;
  final TextAlign? textAlign;
  final List<Shadow>? shadows;
  final TextDecoration? textDecoration;
  final TextOverflow? overflow;
  final int? maxLine;
  final double? letterSpacing;
  final double? wordSpacing;

  const CommonText({
    super.key,
    required this.text,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.decorationColor,
    this.height,
    this.textAlign,
    this.shadows,
    this.textDecoration,
    this.overflow,
    this.fontFamily,
    this.maxLine,
    this.wordSpacing,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      style: TextStyle(
        letterSpacing: letterSpacing,
        overflow: overflow,
        fontFamily: fontFamily,
        color: color ?? Colors.grey,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        height: height ?? 1,
        shadows: shadows ?? [],
        wordSpacing: wordSpacing,
        decoration: textDecoration,
        decorationColor: decorationColor,
      ),
    );
  }
}
