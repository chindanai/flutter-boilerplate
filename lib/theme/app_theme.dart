// Styling inspire from https://github.com/flutter/gallery/blob/master/lib/themes/gallery_theme_data.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;

  static const _highlightColor = Color(0xFF461220);
  static const _primaryColor = Color(0xFF8C2F39);
  static const _backgroundColor = Color(0xFFFED0BB);
  static const _textColor = Colors.white;
  static final _subtitle1 = GoogleFonts.k2d(
    fontWeight: _medium,
    color: _textColor,
    fontSize: 12.0,
  );
  static const double _tabbarIconSize = 25;

  static final TextTheme _textTheme = TextTheme(
    headline1: GoogleFonts.notoSansThai(
      fontWeight: _semiBold,
      color: _primaryColor,
      fontSize: 30.0,
    ),
    headline2: GoogleFonts.notoSansThai(
      fontWeight: _semiBold,
      color: _primaryColor,
      fontSize: 28.0,
    ),
    headline3: GoogleFonts.notoSansThai(
      fontWeight: _medium,
      color: _primaryColor,
      fontSize: 22.0,
    ),
    headline4: GoogleFonts.notoSansThai(
      fontWeight: _medium,
      color: _primaryColor,
      fontSize: 20.0,
    ),
    headline5: GoogleFonts.notoSansThai(
      fontWeight: _medium,
      color: _primaryColor,
      fontSize: 18.0,
    ),
    headline6: GoogleFonts.notoSansThai(
      fontWeight: _medium,
      fontSize: 16.0,
      color: _primaryColor,
    ),
    bodyText1: GoogleFonts.notoSansThai(
      fontSize: 14.0,
      color: _textColor,
    ),
    bodyText2: GoogleFonts.notoSansThai(
      fontSize: 16.0,
      color: _textColor,
    ),
    caption: GoogleFonts.notoSansThai(
      fontWeight: _semiBold,
      color: _textColor,
      fontSize: 16.0,
    ),
    subtitle1: _subtitle1,
    subtitle2: GoogleFonts.notoSansThai(
      fontWeight: _medium,
      fontSize: 12.0,
      color: _textColor,
    ),
    overline: GoogleFonts.notoSansThai(
      fontWeight: _medium,
      color: _textColor,
      fontSize: 12.0,
    ),
    button: GoogleFonts.notoSansThai(
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
      color: _textColor,
    ),
  );

  static ThemeData get themeData => ThemeData(
        scaffoldBackgroundColor: _backgroundColor,
        textTheme: _textTheme,
        highlightColor: _highlightColor,
        primaryColor: _primaryColor,
        backgroundColor: _backgroundColor,
        dividerColor: const Color(0xFFEEEEEE),
        hintColor: const Color(0xFF999999),
        appBarTheme: _appBarTheme,
        unselectedWidgetColor: const Color(0xFFFCB9B2),
        bottomNavigationBarTheme: _bottomNavigationBarTheme,
      );

  static AppBarTheme get _appBarTheme => AppBarTheme(
        iconTheme: const IconThemeData(
          color: _primaryColor,
        ),
        titleTextStyle: _textTheme.headline6,
        color: Colors.white,
        elevation: 1,
        centerTitle: true,
      );

  static BottomNavigationBarThemeData get _bottomNavigationBarTheme =>
      BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedLabelStyle: _subtitle1,
        selectedLabelStyle: _subtitle1,
        selectedItemColor: _highlightColor,
        selectedIconTheme: const IconThemeData(
          color: _highlightColor,
          size: _tabbarIconSize,
        ),
        unselectedIconTheme: const IconThemeData(
          size: _tabbarIconSize,
        ),
      );
}
