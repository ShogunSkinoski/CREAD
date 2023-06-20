import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

part 'color_schemes.g.dart';

class AppTheme {
  AppTheme._init();
  static final AppTheme _instance = AppTheme._init();
  static AppTheme get instance => _instance;

  static ThemeData get darkTheme => ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        visualDensity: VisualDensity.standard,
        appBarTheme: const AppBarTheme().copyWith(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 1,
        ),
        colorScheme: darkColorScheme,
        textTheme: GoogleFonts.ralewayTextTheme().copyWith(
          titleSmall: GoogleFonts.raleway(
            color: darkColorScheme.onBackground,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: GoogleFonts.raleway(
            color: darkColorScheme.onBackground,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: GoogleFonts.raleway(
            color: darkColorScheme.onBackground,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          bodySmall: GoogleFonts.raleway(
            color: darkColorScheme.onBackground,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: GoogleFonts.raleway(
            color: darkColorScheme.onBackground,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: GoogleFonts.raleway(
            color: darkColorScheme.onBackground,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData().copyWith(
          elevation: 2,
        ),
      );

  static ThemeData get lightTheme => ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        visualDensity: VisualDensity.standard,
        appBarTheme: const AppBarTheme().copyWith(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 1,
        ),
        colorScheme: lightColorScheme,
        textTheme: GoogleFonts.ralewayTextTheme().copyWith(),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData().copyWith(
          elevation: 2,
        ),
      );
}
