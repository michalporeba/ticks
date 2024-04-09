import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static double scaleFactor = 1.5;
  static double defaultIconSize = 24;

  static ThemeData sjac(BuildContext context) {
    final base = ThemeData.light();

    return ThemeData(
      useMaterial3: true,
      appBarTheme: base.appBarTheme.copyWith(
        iconTheme: IconThemeData(size: defaultIconSize * scaleFactor)
      ),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          background: Color(0xfffff7ab),
          onBackground: Color(0xff222222),
          surface: Color(0xfffff7ab),
          onSurface: Color(0xff222222),
          error: Colors.red,
          onError: Colors.white,
          primary: Color(0xfffeb605),
          onPrimary: Color(0xff000000),
          secondary: Color(0xff03a475),
          onSecondary: Color(0xffffffff),

      ),
      iconTheme: base.iconTheme.copyWith(
        size: defaultIconSize * scaleFactor,
      ),
      primaryIconTheme: base.iconTheme.copyWith(
        size: defaultIconSize * scaleFactor,
      ),
      textTheme: GoogleFonts.heeboTextTheme(
        Theme.of(context).textTheme.apply(fontSizeFactor: scaleFactor),
      ),
    );
  }
}
