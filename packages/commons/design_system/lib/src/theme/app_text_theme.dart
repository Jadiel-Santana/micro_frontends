import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static const TextStyle paragraph1 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    height: 1.41,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    height: 1.35,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const TextStyle button1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
    height: 1.68,
    leadingDistribution: TextLeadingDistribution.even,
  );
}
