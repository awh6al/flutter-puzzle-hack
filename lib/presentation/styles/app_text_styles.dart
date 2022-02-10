import 'package:flutter/cupertino.dart';

class AppTextStyles {
  static const String primaryFontFamily = 'PaytoneOne';

  static const String secondaryFontFamily = 'Montserrat';

  static const TextStyle tile = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );


  static const TextStyle title = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 25,
  );

  static const TextStyle body = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 16,
  );

  static const TextStyle bodySm = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 14,
  );

  static const TextStyle bodyXs = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 12,
  );

  static const TextStyle button = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 16,
    height: 1,
  );
}
